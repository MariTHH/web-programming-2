package servlets;

import data.ShotCollectionManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CleanTableServlet", value = "/cleaner")
public class CleanTableServlet extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShotCollectionManager.clear();
        request.getSession().setAttribute("shots", ShotCollectionManager.getCollection());
    }
}