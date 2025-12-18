package com.gamepex.admin.rental;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class CreateInvoiceNumber {

	public String createInvoiceNumber() {
		String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		
		String randomChars = generateRandomChars(4);
		
		String invoiceNumber = timestamp+ "-" +randomChars;
		
		return invoiceNumber;
	}
	
	private String generateRandomChars(int length) {
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i=0; i<length; i++) {
			sb.append(chars.charAt(random.nextInt(chars.length())));
		}
		return sb.toString();
	}
}
