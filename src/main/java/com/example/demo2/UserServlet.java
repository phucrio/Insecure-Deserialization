package com.example.demo2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Base64;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {

    private static String serialize(Serializable obj) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream(512);
        try (ObjectOutputStream out = new ObjectOutputStream(baos)) {
            out.writeObject(obj);
        }
        return Base64.getEncoder().encodeToString(baos.toByteArray());
    }

    private static <T> T deserialize(String base64SerializedObj) throws Exception {
        try (ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(Base64.getDecoder().decode(base64SerializedObj)))) {
            @SuppressWarnings({"unchecked", "restriction" })
            T obj = (T) in.readObject();
            return obj;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("encode".equals(action)) {
                User user = new User(request.getParameter("username"), request.getParameter("email"),
                        Integer.parseInt(request.getParameter("birthYear")), request.getParameter("gender"));
                String serializedObject = serialize(user);
                request.setAttribute("encodedUser", serializedObject);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else if ("decode".equals(action)) {
                String base64Str = request.getParameter("base64");
                User user = deserialize(base64Str);
                request.setAttribute("user", user);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
        }
    }

}
