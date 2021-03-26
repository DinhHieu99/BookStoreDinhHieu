package com.bookstore;

import java.util.List;

import com.bookstore.entities.Cart;

public class IsExisting {

	public static int isExisting(Integer id, List<Cart> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getId() == id) {
				return i;
			}
		}
		return -1;
	}
	public static double totalMoney(List<Cart> cart) {
		double count = 0;
		for (int i = 0; i < cart.size(); i++) {
			count += cart.get(i).getMoney();
		}
		return count;
	}
}
