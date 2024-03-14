package vo;

public class GalleryVO {
	
		private int num;
		private String imgname;// 이미지이름
		private String comm;
		private String pdate;
		private String reip; // ip
		private int price; // 가격
		private int qty; // 수량
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getImgname() {
			return imgname;
		}
		public void setImgname(String imgname) {
			this.imgname = imgname;
		}
		public String getComm() {
			return comm;
		}
		public void setComm(String comm) {
			this.comm = comm;
		}
		public String getPdate() {
			return pdate;
		}
		public void setPdate(String pdate) {
			this.pdate = pdate;
		}
		public String getReip() {
			return reip;
		}
		public void setReip(String reip) {
			this.reip = reip;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getQty() {
			return qty;
		}
		public void setQty(int qty) {
			this.qty = qty;
		}

	
}
