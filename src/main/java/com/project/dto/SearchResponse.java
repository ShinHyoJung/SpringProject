package com.project.dto;

import com.project.vo.Board;

import java.util.List;

public class SearchResponse {

    private Paging paging;

    public Paging getPaging()
    {
        return paging;
    }

    public void setPaging(Paging paging)
    {
        this.paging = paging;
    }

    public List<Board> getSearchResponseList()
    {
        return SearchResponseList;
    }

    public void setSearchResponseList(List<Board> searchResponseList)
    {
        SearchResponseList = searchResponseList;
    }

    private List<Board> SearchResponseList;

    public SearchResponse(Paging paging, List<Board> SearchResponseList) {
        this.paging = paging;
        this.SearchResponseList = SearchResponseList;
    }
}
