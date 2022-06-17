package com.project.vo;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:02
 * Comments:
 */
public class Comment
{

    private int cno;
    private String ctext;
    private String cwriter;
    private int bno;
    private int idx;

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getCtext() {
        return ctext;
    }

    public void setCtext(String ctext) {
        this.ctext = ctext;
    }

    public String getCwriter() {
        return cwriter;
    }

    public void setCwriter(String cname) {
        this.cwriter = cname;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }
}
