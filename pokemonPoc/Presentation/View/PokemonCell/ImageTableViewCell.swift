//
//  ImageTableViewCell.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 10/11/21.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "pokemon_detail_image_cell"
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    let DEFAULT_HEIGHT = CGFloat(100)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        scrollView = UIScrollView()
        pageControl = UIPageControl()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: DEFAULT_HEIGHT)
        scrollView.contentSize = CGSize(width: contentView.frame.width, height: DEFAULT_HEIGHT)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.heightAnchor.constraint(equalToConstant: DEFAULT_HEIGHT).isActive = true
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        
        pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 0
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPageIndicatorTintColor = .red
        contentView.addSubview(pageControl)
        
        contentView.addConstraints([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0),
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 15.0),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0)
        ])
    }
    
    func setupCell(images: PokemonImageModel) {
        pageControl.numberOfPages = images.url.count
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: DEFAULT_HEIGHT)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width * CGFloat(images.url.count), height: DEFAULT_HEIGHT)

        for i in 0 ..< images.url.count {
            if let imageUrl = URL(string: images.url[i]) {
                let image = UIImageView(frame: CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
                image.sd_setImage(with: imageUrl, completed: nil)
                image.contentMode = .scaleAspectFit
                scrollView.addSubview(image)
            }
        }
    }
    
}

extension ImageTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(round(scrollView.contentOffset.x / contentView.frame.width))
    }
}
