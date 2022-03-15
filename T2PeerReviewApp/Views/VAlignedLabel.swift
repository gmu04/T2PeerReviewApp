// CustomLabel.swift by Gokhan Mutlu on 14.03.2022

import UIKit



//MARK: "VAlignedLabel is implemented or deleted according to UI/UX standards of \"DescriptionViewController\" vc.")
class VAlignedLabel: UILabel {

	@available(*, unavailable, message: "This property observer is for demo purpose.")
	var verticalAlignment:VerticalAlignment = .middle{
		didSet{
			//let txt = self.text ?? ""

			//let str = NSString(string: txt)
			//.size(with: self.font, constrainedTo: CGSize(width: self.bounds.width, height: self.bounds.height))
			//ize(maxSize, options: [.TruncatesLastVisibleLine, .UsesLineFragmentOrigin], attributes: [NSFontAttributeName: fontName], context: nil).size

			//MARK: Similar to this code
			/*
			  
			 switch (_alignment)
			{
				case mrLabelAlignmentVerticallyTop:
					self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, s.height);
					break;
				case mrLabelAlignmentVerticallyMiddle:
					self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + (self.frame.size.height - s.height)/2, self.frame.size.width, s.height);
					break;
				case mrLabelAlignmentVerticallyBottom:
					self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + (self.frame.size.height - s.height), self.frame.size.width, s.height);
					break;
				default:
					break;
			}*/
		}
	}
	

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


	
	override func layoutSubviews() {
		super.layoutSubviews()
		//self.verticalAlignment = .top
	}
	
	enum VerticalAlignment{
		case top, middle, bottom
	}
}
