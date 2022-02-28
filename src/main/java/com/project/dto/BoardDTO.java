package com.project.dto;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:35
 * Comments:
 */
public class BoardDTO {

    private int bno;
    private String btitle;
    private String bcontent;
    private String bwriter;
    private int bhit;
    private int bheart;
    private String bdatetime;
    private String bupdatetime;
    private int idx;


    public int getBno() {
        return bno;
    }

    public void setBno(int bno)
    {
        this.bno = bno;
    }

    public String getBtitle()
    {
        return btitle;
    }

    public void setBtitle(String btitle)
    {
        this.btitle = btitle;
    }

    public String getBcontent()
    {
        return bcontent;
    }

    public void setBcontent(String bcontent)
    {
        this.bcontent = bcontent;
    }

    public String getBwriter()
    {
        return bwriter;
    }

    public void setBwriter(String bwriter)
    {
        this.bwriter = bwriter;
    }

    public int getBhit()
    {
        return bhit;
    }

    public void setBhit(int bhit)
    {
        this.bhit = bhit;
    }

    public int getBheart() {
        return bheart;
    }

    public void setBheart(int bheart) {
        this.bheart = bheart;
    }

    public String getBdatetime()
    {
        return bdatetime;
    }

    public void setBdatetime(String bdatetime)
    {
        this.bdatetime = bdatetime;
    }

    public String getBupdatetime() {
        return bupdatetime;
    }

    public void setBupdatetime(String bupdatetime) {
        this.bupdatetime = bupdatetime;
    }

    public int getIdx()
    {
        return idx;
    }

    public void setIdx(int idx)
    {
        this.idx = idx;
    }
}
