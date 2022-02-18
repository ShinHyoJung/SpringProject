package com.project.dto;

/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오후 1:29
 * Comments:
 */
public class MemberDTO
{
    private int idx;
    private String id;
    private String name;
    private String password;
    private String pnum;
    private String address;
    private String mdatetime;

    public int getIdx()
    {
        return idx;
    }

    public void setIdx(int idx)
    {
        this.idx = idx;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getPnum()
    {
        return pnum;
    }

    public void setPnum(String pnum)
    {
        this.pnum = pnum;
    }
    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getMdatetime()
    {
        return mdatetime;
    }

    public void setMdatetime(String mdatetime)
    {
        this.mdatetime = mdatetime;
    }

    @Override
    public String toString() {
        return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", pnum=" + pnum + ", address=" + address + "]";
    }
}
