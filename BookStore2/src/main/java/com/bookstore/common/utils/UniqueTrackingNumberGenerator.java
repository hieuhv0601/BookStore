package com.bookstore.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class UniqueTrackingNumberGenerator {
	public static String generateUniqueTrackingNumber() {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	    String timestamp = dateFormat.format(new Date());

	    // Generate a random 4-digit number
	    Random random = new Random();
	    int randomNumber = random.nextInt(10000);

	    // Combine the timestamp and random number to create a unique tracking number
	    String trackingNumber = "TN" + timestamp + String.format("%04d", randomNumber);

	    return trackingNumber;
	}
}
