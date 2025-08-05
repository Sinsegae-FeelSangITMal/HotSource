package hotsource.model.asset;

import hotsource.domain.Asset;
import lombok.Data;

@Data
public class AssetDetailDTO {
	private Asset asset;
	private double average_rate;
	private int review_count;
	private int wish_count;
	private int sale_price;
	private boolean isPurchased;
	private boolean isWished;
	private boolean isCart;
	

	public String printAsset() {
	    if (asset == null) return "Asset is null";

	    return "Asset{" +
	            "asset_id=" + asset.getAsset_id() +
	            ", title='" + asset.getTitle() + '\'' +
	            ", price=" + asset.getPrice() +
	            ", summary='" + asset.getSummary() + '\'' +
	            ", description='" + asset.getDescription() + '\'' +
	            ", youtube_url='" + asset.getYoutube_url() + '\'' +
	            ", create_date=" + asset.getCreate_date() +
	            ", view_count=" + asset.getView_count() +
	            ", sale=" + (asset.getSale() != null ? asset.getSale().getSale_value() : "null") +
	            ", thumbnail=" + (asset.getThumbnail() != null ? asset.getThumbnail().toString() : "null") +
	            ", seller=" + (asset.getSeller() != null ? asset.getSeller().getSeller_name() : "null") +
	            ", reviewList.size=" + (asset.getReviewList() != null ? asset.getReviewList().size() : 0) +
	            ", keywordList.size=" + (asset.getKeywordList() != null ? asset.getKeywordList().size() : 0) +
	            ", fileList.size=" + (asset.getFileList() != null ? asset.getFileList().size() : 0) +
	            ", imgList.size=" + (asset.getImgList() != null ? asset.getImgList().size() : 0) +
	            ", saleList.size=" + (asset.getSaleList() != null ? asset.getSaleList().size() : 0) +
	            '}';
	}
}
