package hotsource.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="asset")
public class Asset {
	@Id
	private Long asset_id;
	private String title;
	private int price;
	private String summary;
	private String description;
	private String youtube_url;
	@Column(name = "create_date", insertable = false, updatable = false)
	private LocalDateTime create_date;
	private int view_count;	
	
	@ManyToOne
    @JoinColumn(name = "seller_id")
    private Seller seller;

    @ManyToOne
    @JoinColumn(name = "subcategory_id")
    private SubCategory subCategory;
}
