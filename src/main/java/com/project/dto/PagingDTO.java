package com.project.dto;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-22
 * Time: 오후 4:06
 * Comments:
 */
public class PagingDTO { // 페이지 계산



    private int startPage; // 시작페이지
    private int endPage; // 끝페이지
    private boolean prev; // 이전페이지 존재유무
    private boolean next; // 다음페이지
    private int total; // 전체 게시글 수
    private Criteria cri; // 현재페이지, 페이지당 게시글 표시수 정보

    public PagingDTO(Criteria cri, int total) { //

        this.cri = cri;
        this.total = total;

        this.endPage = (int)(Math.ceil(cri.getPageNum()/5.0))*5; // 끝번호를 구한다.  페이지를 5로 나눈후 그 값을 올림해서 5를 곱함 반올림을하는 식

        this.startPage = this.endPage - 4; // 첫번째 번호는 페이지번호들-1인 4를 빼주면 나옴

        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount())); // total을 amount로 나눠서 올림

        if(realEnd < this.endPage) { // 마지막 페이지 유효한지 체크
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1; // 시작 페이지값이 1보다 큰 경우 true

        this.next = this.endPage < realEnd; // 마지막 페이지값이 1보다 큰경우 true

    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Criteria getCri() {
        return cri;
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    @Override
    public String toString() {
        return "PagingDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
                + ", total" + total + ", cri=" + cri + "]";
    }
}
