package ucar.member.model;

public class CardVO {
	private String cardNo;
	private String memberId;
	private String cardType;
	private String cardExpirationDate;
	private String cardPassword;
	public CardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CardVO(String cardNo, String memberId, String cardType,
			String cardExpirationDate, String cardPassword) {
		super();
		this.cardNo = cardNo;
		this.memberId = memberId;
		this.cardType = cardType;
		this.cardExpirationDate = cardExpirationDate;
		this.cardPassword = cardPassword;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardExpirationDate() {
		return cardExpirationDate;
	}
	public void setCardExpirationDate(String cardExpirationDate) {
		this.cardExpirationDate = cardExpirationDate;
	}
	public String getCardPassword() {
		return cardPassword;
	}
	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}
	@Override
	public String toString() {
		return "CardVO [cardNo=" + cardNo + ", memberId=" + memberId
				+ ", cardType=" + cardType + ", cardExpirationDate="
				+ cardExpirationDate + ", cardPassword=" + cardPassword + "]";
	}
	
}
