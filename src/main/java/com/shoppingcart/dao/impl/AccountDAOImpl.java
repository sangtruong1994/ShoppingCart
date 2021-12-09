package com.shoppingcart.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shoppingcart.dao.AccountDAO;
import com.shoppingcart.entity.Account;
import com.shoppingcart.model.AccountInfo;
import com.shoppingcart.model.PaginationResult;

@Repository
@Transactional(rollbackFor = Exception.class)
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public Account getAccountByUserName(String username) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT ACC FROM Account ACC WHERE ACC.username = :USERNAME";
		Query<Account> query = session.createQuery(hql);
		query.setParameter("USERNAME", username);
		Account account = (Account) query.uniqueResult();
		return account;
	}

	public PaginationResult<AccountInfo> getAllAccountInfos(int page, int maxResult, int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT NEW " + AccountInfo.class.getName()
				+ " (ACC.username, ACC.password, ACC.active, ACC.userRole) FROM Account ACC";
		Query<AccountInfo> query = session.createQuery(hql);
		return new PaginationResult<AccountInfo>(query, page, maxResult, maxNavigationPage);
	}

	public void saveAccountInfo(AccountInfo accountInfo) {
		Session session = sessionFactory.getCurrentSession();
		String username = accountInfo.getUsername();
		Account account = null;
		boolean isNew = false;

		if (username != null) {
			account = getAccountByUserName(username);
		}

		if (account == null) {
			isNew = true;
			account = new Account();
		}

		account.setUsername(username);
		String encodedPassword = bCryptPasswordEncoder.encode(accountInfo.getPassword());
		account.setPassword(encodedPassword);
		account.setUserRole(accountInfo.getUserRole());
		account.setActive(accountInfo.isActive());

		if (isNew) {
			session.persist(account);
		}
		session.flush();

	}

	public boolean removeAccountByUsername(String username) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "DELETE FROM Account ACC WHERE ACC.username = :username1";
			Query query = session.createQuery(hql);
			query.setParameter("username1", username);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
}
