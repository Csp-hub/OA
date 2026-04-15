package com.campus.oa.common;

import lombok.Data;

@Data
public class Response {
    private int code;
    private String message;
    private Object data;

    public static Response success(Object data) {
        Response response = new Response();
        response.setCode(200);
        response.setMessage("success");
        response.setData(data);
        return response;
    }

    public static Response error(int code, String message) {
        Response response = new Response();
        response.setCode(code);
        response.setMessage(message);
        return response;
    }

    public static Response error(String message) {
        return error(500, message);
    }
}
