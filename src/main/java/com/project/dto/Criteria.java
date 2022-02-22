package com.project.dto;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-22
 * Time: 오후 5:23
 * Comments:
 */
public class Criteria {


    // 현재 페이지
    private int pageNum;

    // 한 페이지당 보여질 게시물 갯수
    private int amount;

    // 스킵할 게시물의 수 (pageNum-1) * amount)
    private int skip;
    // 기본 생성자 -> 기본 세팅: pageNum=1, amount=10
    public Criteria() {
        this(1, 10);
    }

    // 생성자 => 원하는 pageNum, 원하는 amount
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1) * amount;

    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {

        this.skip = (pageNum-1) * this.amount;
        this.pageNum = pageNum;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {

        this.skip = (this.pageNum-1) * amount;
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
    }

}
