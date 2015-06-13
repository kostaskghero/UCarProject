package ucar.member.model;


public class CardVO {
	private String cardNo;
	private String cardType;
	private String cardExpirationDate;
	private String cardPassword;
	private String cardBirth;
	public CardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CardVO(String cardNo, String cardType, String cardExpirationDate,
			String cardPassword, String cardBirth) {
		super();
		this.cardNo = cardNo;
		this.cardType = cardType;
		this.cardExpirationDate = cardExpirationDate;
		this.cardPassword = cardPassword;
		this.cardBirth = cardBirth;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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
	public String getCardBirth() {
		return cardBirth;
	}
	public void setCardBirth(String cardBirth) {
		this.cardBirth = cardBirth;
	}
	@Override
	public String toString() {
		return "CardVO [cardNo=" + cardNo + ", cardType=" + cardType
				+ ", cardExpirationDate=" + cardExpirationDate
				+ ", cardPassword=" + cardPassword + ", cardBirth=" + cardBirth
				+ "]";
	}	
}
