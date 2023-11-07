package servlets;

import data.Shot;
import data.ShotCollectionManager;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "area-check-servlet", value = "/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter pw = response.getWriter();
        LocalDateTime startTime = LocalDateTime.now(ZoneOffset.UTC);
        ObjectMapper om = new ObjectMapper();
        try {
            float x = Float.parseFloat(request.getParameter("x-value"));
            float y = Float.parseFloat(request.getParameter("y-value"));
            float r = Float.parseFloat(request.getParameter("r-value"));
            log("X: " + x);
            log("Y: " + y);
            log("R: " + r);

            boolean status = isHit(x, y, r);

            if (!validateVariables(x, y, r) && !status) {
                log("variables arent valid(");
                response.setStatus(400);
                return;
            }

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            Shot newShot = new Shot(x, y, r, startTime.minusMinutes(Long.parseLong(request.getParameter("timezone"))).format(formatter),
                    (long) (LocalDateTime.now().minusNanos(startTime.getNano()).getNano() * 0.000001),status);
            ShotCollectionManager.add(newShot);
            log("Shot successfully added");

            HttpSession session = request.getSession();
            List<Shot> shots = ShotCollectionManager.getCollection();
            session.setAttribute("shots", shots);

            String responseBody = om.writeValueAsString(newShot);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            pw.write(responseBody);
            pw.flush();
        } catch (NumberFormatException ignored) {
        }
    }

    private boolean validateVariables(double x, double y, double r) {
        return y >= -5 && y <= 3 && x >= -3 && x <= 5 && r >= 1 && r <= 3;
    }

    private boolean isHit(double x, double y, double r) {
        return isCircleZone(x, y, r) || isTriangleZone(x, y, r) || isRectangleZone(x, y, r);
    }

    private boolean isRectangleZone(double x, double y, double r) {
        return (x >= 0) && (y >= 0) && (x <= r / 2) && (y <= r);
    }

    private boolean isCircleZone(double x, double y, double r) {
        return (x * x + y * y <= r * r) && (x <= 0) && (y <= 0);
    }

    private boolean isTriangleZone(double x, double y, double r) {
        return (x <= 0) && (y <= 0) && (y >= (2) * x - r);
    }
}