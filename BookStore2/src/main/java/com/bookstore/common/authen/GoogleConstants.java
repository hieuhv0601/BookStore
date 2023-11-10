package com.bookstore.common.authen;

public class GoogleConstants {
	public static String GOOGLE_CLIENT_ID = "816860003507-6r7mp8dduvmeho2umae7uef2qq98ienk.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8681/BookStore/login-google";

    public static String GOOGLE_REDIRECT_URI_2 = "http://localhost:8681/BookStore/register-google";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
