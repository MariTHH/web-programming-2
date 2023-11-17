package servlets;

import data.ShotCollectionManager;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;


import java.io.IOException;

@WebServlet(name = "CleanTableServlet", value = "/cleaner")
public class CleanTableServlet extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShotCollectionManager.clear();
        request.getSession().setAttribute("shots", ShotCollectionManager.getCollection());
    }
}