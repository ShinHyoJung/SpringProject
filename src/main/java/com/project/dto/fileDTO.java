package com.project.dto;

public class fileDTO {


    private int fno;
    private String org_fname;
    private String stored_fname;
    private String fsize;
    private String fdatetime;
    private String fdel;


    public int getFno() {
        return fno;
    }

    public void setFno(int fno) {
        this.fno = fno;
    }

    public String getOrg_fname() {
        return org_fname;
    }

    public void setOrg_fname(String org_fname) {
        this.org_fname = org_fname;
    }

    public String getStored_fname() {
        return stored_fname;
    }

    public void setStored_fname(String stored_fname) {
        this.stored_fname = stored_fname;
    }

    public String getFsize() {
        return fsize;
    }

    public void setFsize(String fsize) {
        this.fsize = fsize;
    }

    public String getFdatetime() {
        return fdatetime;
    }

    public void setFdatetime(String fdatetime) {
        this.fdatetime = fdatetime;
    }

    public String getFdel() {
        return fdel;
    }

    public void setFdel(String fdel) {
        this.fdel = fdel;
    }

}
