package hotsource.model.wishlist;

import hotsource.domain.Wishlist;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class WishlistSimpleDTO {
    private Long wishlist_id;
    private String title;
    private int itemCount; // 찜 목록에 담긴 아이템 수
    private String thumbUrl; // 대표 썸네일용 URL (optional) 
    private long asset_id; 
    private boolean isContained;  //에셋이 이미 이 목록에 포함되어있는지 여부 
    
    public WishlistSimpleDTO(Wishlist wishlist) {
        this.wishlist_id = wishlist.getWishlist_id();
        this.title = wishlist.getList_name();
        this.itemCount = wishlist.getItemList().size();
        this.thumbUrl = extractThumbnail(wishlist);
    }
    
    private String extractThumbnail(Wishlist wishlist) {
        if(wishlist.getItemList().size() == 0) {
        	return "/static/images/noimg.jpg";
        }
        else {
        	log.debug("wishlist.size()=" + wishlist.getItemList().size());
        	this.asset_id = wishlist.getItemList().get(0).getAsset().getAsset_id();
        	log.debug("wishlist.asset_id()=" + wishlist.getItemList().get(0).getAsset().getAsset_id());;
        	return wishlist.getItemList().get(0).getAsset().getThumbnail().getAsset_img_url();
        }
    }
}