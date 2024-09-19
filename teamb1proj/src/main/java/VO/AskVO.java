package VO;

public class AskVO {
   private int askNo;
   private String id;
   private int askCate;
   private String askTitle;
   private String askContent;
   private String createDate;
   private String askReply;
   private int askState;
   private String askReplyDate;

   public int getAskNo() {
      return this.askNo;
   }

   public String getId() {
      return this.id;
   }

   public int getAskCate() {
      return this.askCate;
   }

   public String getAskTitle() {
      return this.askTitle;
   }

   public String getAskContent() {
      return this.askContent;
   }

   public String getCreateDate() {
      return this.createDate;
   }

   public String getAskReply() {
      return this.askReply;
   }

   public int getAskState() {
      return this.askState;
   }

   public String getAskReplyDate() {
      return this.askReplyDate;
   }

   public void setAskNo(int askNo) {
      this.askNo = askNo;
   }

   public void setId(String id) {
      this.id = id;
   }

   public void setAskCate(int askCate) {
      this.askCate = askCate;
   }

   public void setAskTitle(String askTitle) {
      this.askTitle = askTitle;
   }

   public void setAskContent(String askContent) {
      this.askContent = askContent;
   }

   public void setCreateDate(String createDate) {
      this.createDate = createDate;
   }

   public void setAskReply(String askReply) {
      this.askReply = askReply;
   }

   public void setAskState(int askState) {
      this.askState = askState;
   }

   public void setAskReplyDate(String askReplyDate) {
      this.askReplyDate = askReplyDate;
   }
}
