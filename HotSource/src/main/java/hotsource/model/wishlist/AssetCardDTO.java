package hotsource.model.wishlist;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class AssetCardDTO {
	private long asset_id;
	private String seller_name;
	private String title;
	private String thumbnail_url;
	private int price;
	private int salePrice;
	private int sale_value;
	private double average_rate;
	private int review_count;
	private boolean isPurchased;
	private boolean isWished;
	private boolean isInCart;
	private boolean isHot;
	private boolean isNew;
	
	public List<BadgeType> getBadges(){
		List<BadgeType> badges = new ArrayList<>();
		if(isPurchased) {
			badges.add(BadgeType.PURCHASED);
		} else {
			if(isHot) badges.add(BadgeType.HOT); 
			if(isNew) badges.add(BadgeType.NEW);
			if(price == 0) badges.add(BadgeType.FREE);
			if(sale_value > 0) badges.add(BadgeType.SALE);
			if(badges.size() == 0) badges.add(BadgeType.NO_BADGE);
		}
		return badges;
	}
	
   @Override
    public String toString() {
        return "AssetCardDTO{" +
                "isPurchased=" + isPurchased +
                ", isWished=" + isWished +
                ", isInCart=" + isInCart +
                ", isHot=" + isHot +
                ", isNew=" + isNew +
                ", average_rate=" + average_rate +
                ", seller_name='" + seller_name + '\'' +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", salePrice=" + salePrice +
                ", sale_value=" + sale_value +
                '}';
    }
	
}
