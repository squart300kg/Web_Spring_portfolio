package te.pr.common;

public class Criteria {
	
	//게시물 리스트를 조회했을 때 처음 시작 페이지 번호
    private int page;
    private int perPageNum;
    private int width; 
    
    
    public Criteria() {
        this.page = 1;
        this.perPageNum = 5;
        this.width = 5;
    }

    public void setPage(int page) {

        if (page <= 0) {
            this.page = 1;
            return;
        }

        this.page = page;
    }

    public int getPage() {
        return page;
    }

    public void setPerPageNum(int perPageNum) {

        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 3;
            return;
        }

        this.perPageNum = perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    @Override
    public String toString() {
        return "Criteria{" +
                "page=" + page +
                ", perPageNum=" + perPageNum +
                '}';
    }
}
