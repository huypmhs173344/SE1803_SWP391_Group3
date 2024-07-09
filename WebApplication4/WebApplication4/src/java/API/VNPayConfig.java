/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package API;

import jakarta.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class VNPayConfig {

    public static final String vnp_TmnCode = "JW8CMROH";
    public static final String vnp_HashSecret = "65139RRKQXW658CUR242B95LES81E25H";
    public static final String vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static final String vnp_ReturnUrl = "http://localhost:9999/WebApplication4/VNPay_ReturnController";

    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        return ipAddress;
    }

    public static String getRandomNumber(int length) {
        String chars = "0123456789";
        StringBuilder result = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            result.append(chars.charAt(random.nextInt(chars.length())));
        }
        return result.toString();
    }

    public static String getCurrentDate() {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        return String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", calendar);
    }

    public static String getExpireDate(int minutes) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        calendar.add(Calendar.MINUTE, minutes);
        return String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", calendar);
    }

    public static String hashAllFields(Map<String, String> fields) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        List<String> fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames); 

        StringBuilder hashData = new StringBuilder();
        StringBuilder queryString = new StringBuilder();

        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = fields.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                // Build query
                queryString.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                queryString.append('=');
                queryString.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    queryString.append('&');
                    hashData.append('&');
                }
            }
        }

        String vnp_SecureHash = hmacSHA512(vnp_HashSecret, hashData.toString());
        queryString.append("&vnp_SecureHash=");
        queryString.append(URLEncoder.encode(vnp_SecureHash, "UTF-8"));

        return queryString.toString();
    }

    public static String hmacSHA512(String key, String data) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        String result;
        try {
            byte[] byteKey = key.getBytes("UTF-8");
            final String HMAC_SHA512 = "HmacSHA512";
            Mac hmacSHA512;
            hmacSHA512 = Mac.getInstance(HMAC_SHA512);
            SecretKeySpec keySpec = new SecretKeySpec(byteKey, HMAC_SHA512);
            hmacSHA512.init(keySpec);
            byte[] macData = hmacSHA512.doFinal(data.getBytes("UTF-8"));
            result = bytesToHex(macData);
        } catch (Exception e) {
            throw new RuntimeException("Failed to calculate HMAC-SHA512", e);
        }
        return result;
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    public static Map<String, String> getParameterMap(HttpServletRequest request) {
        Map<String, String> map = new HashMap<>();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            StringBuilder sb = new StringBuilder();
            for (String paramValue : paramValues) {
                if (sb.length() > 0) {
                    sb.append(',');
                }
                sb.append(paramValue);
            }
            map.put(paramName, sb.toString());
        }
        return map;
    }
}
