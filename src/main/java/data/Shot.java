package data;

import java.time.Instant;

public class Shot {
    private float x;
    private float y;
    private float r;
    private boolean status;
    private String time;
    private long scriptTime;

    public Shot(float x, float y, float r, String time, long scriptTime, boolean status) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.time = time;
        this.scriptTime = scriptTime;
        this.status = status;
    }

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getR() {
        return r;
    }

    public void setR(float r) {
        this.r = r;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public long getScriptTime() {
        return scriptTime;
    }

    public void setScriptTime(long scriptTime) {
        this.scriptTime = scriptTime;
    }
}