package com.bookstore.controller.exception;

public class HashGenerationException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public HashGenerationException(String message) {
		super(message);
	}

	public HashGenerationException(String message, Throwable cause) {
		super(message, cause);
	}

}
