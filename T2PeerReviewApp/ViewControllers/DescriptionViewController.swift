// DescriptionViewController.swift by Gokhan Mutlu on 14.03.2022

import UIKit


class DescriptionViewController: UIViewController {
	
	init() {
		super.init(nibName: nil, bundle: nil)
		
//		setupView()
//		configureConstraints()
	}
	
	required init?(coder _: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		configureConstraints()
	}
	
	
	private func setupView() {
		view.backgroundColor = .white
		view.addSubview(mainStackView)
		
		#warning("2022-03-14: gokhan: According to given body string, scroll view seems to be necessary")
		//FIXME: Please check the view by uncommenting the following line
		//bodyLabel.text = loremIpsumGenerator()
	}
	
	private func configureConstraints() {
		
		//FIXME: gokhan: 2022-03-14: bottomAnchor makes the body text in the middle, which is probably not acceptable.
		// Easy way to solve it by removing the constraint. Or, another option is to make a custom label which draws a text at the top is another solution.
		
		//TODO: safeAreaLayoutGuide is used for padding
		let mainStackViewConstraints = [
			mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			//mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
		]
		
		
		NSLayoutConstraint.activate(mainStackViewConstraints + [
			bodyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)])
		
		//TODO: gokhan: 2022-03-14: following line needed to be activated - It is added to the above line
		//bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
	}
	
	

	//MARK: - Properties & attributes
	
	private lazy var mainStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [headerLabel, bodyLabel])
		
		#warning("""
		Explanation-1:
		gokhan, 2022-03-14: set translatesAutoresizingMaskIntoConstraints as false in all controls,
			otherwise configureConstraints function won't work (constraints are overridden)
		""")
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.spacing = 10
		stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		return stackView
	}()
	private lazy var headerLabel: UILabel = {
		let label = UILabel()
		//MARK: gokhan, 2022-03-14: see Explanation-1
		label.translatesAutoresizingMaskIntoConstraints = false
		
		//TODO: gokhan, 2022-03-14: Header might be single line. Scale factor is added. (header lenght needs to checked before assinging text)
		label.numberOfLines = 1
		label.minimumScaleFactor = 0.5
		
		//MARK: if font size is defined by UX/UI guy, 16 point is too small for header. I chancged it to .title1 (& make it bold)
		label.font = UIFont.preferredFont(forTextStyle: .title1)
		label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
			//.systemFont(ofSize: 16, weight: .bold)
		
		label.text = "Some Header"
		label.setContentHuggingPriority(.defaultHigh, for: .vertical)
		return label
	}()
	
	private lazy var bodyLabel: UILabel = {
		let label = UILabel()
		//MARK: gokhan, 2022-03-14: see Explanation-1
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		
		//MARK: if font size is defined by UX/UI guy, 12 point is too small. I commented it.
		//label.font = .systemFont(ofSize: 12)
		label.text = "Some long body"
		label.setContentHuggingPriority(.defaultLow, for: .vertical)
		label.textAlignment = .left
		return label
	}()
	
}


extension DescriptionViewController{
	
	fileprivate func loremIpsumGenerator() -> String{
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec risus iaculis, dictum elit at, accumsan nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ullamcorper tellus ac dui posuere congue. Vestibulum vel diam volutpat, consequat enim lacinia, molestie purus. Duis ut leo purus. Donec quis lectus leo. Fusce laoreet metus sit amet lorem pulvinar, sit amet dictum arcu fringilla. Praesent et mi augue. Donec lobortis ex dolor, vitae venenatis turpis ornare sed. Curabitur sed accumsan metus, ut pharetra libero. Praesent imperdiet elit ipsum, dapibus pulvinar ex vehicula vel.

Vivamus sit amet massa ut purus consectetur efficitur et et nisi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin rutrum fringilla vestibulum. Aliquam erat volutpat. Nunc nunc nibh, tempor sed pellentesque consectetur, gravida in tortor. Vestibulum pellentesque nibh nunc. Morbi sagittis dignissim tortor nec vestibulum. Pellentesque ultricies id diam a maximus. Praesent lobortis nisl in tellus tristique, et fermentum lacus porttitor. Curabitur condimentum libero eu purus eleifend, eget hendrerit sapien gravida. Sed elementum leo non magna pharetra ultricies.

Aliquam nec magna commodo, ullamcorper magna sit amet, volutpat sem. Fusce elementum, sapien vitae facilisis sollicitudin, lacus sapien elementum dolor, id mollis turpis sapien non nulla. Nam a mi viverra, ultrices lectus et, pellentesque ex. Integer porttitor magna nec nibh vestibulum, quis imperdiet ex eleifend. Nam id quam quis sem dictum egestas. Ut eros tellus, mollis a nulla vel, mollis cursus elit. Fusce finibus id velit in sodales. Proin massa mi, cursus vel commodo a, auctor eleifend metus. Pellentesque pellentesque volutpat neque, non ornare ligula pharetra a. Proin nec elit rhoncus, egestas leo quis, tristique risus.

In quis magna laoreet, commodo neque sit amet, varius nunc. Nulla ultricies dolor vel nunc mollis volutpat. Donec ut hendrerit enim. Vestibulum molestie, ex sit amet auctor interdum, dolor nulla ornare mauris, et pharetra ex leo vitae dolor. Nullam faucibus, augue sit amet vestibulum bibendum, turpis mi porttitor orci, sed dapibus nisl massa quis lectus. Curabitur non massa non justo euismod cursus sed id dolor. Donec volutpat eu risus sed placerat. Morbi dapibus facilisis ipsum, vel suscipit felis accumsan sit amet. Donec ligula sapien, dapibus at varius ac, sodales imperdiet nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam interdum, dui ac placerat mollis, orci nisi accumsan odio, quis pharetra diam felis et quam. Sed volutpat est neque, sed rutrum ex luctus vel. Phasellus tempus luctus efficitur.

Aenean nisi est, venenatis sit amet felis eu, auctor facilisis mauris. Integer condimentum accumsan mauris, sed facilisis metus accumsan eget. Nullam est nisi, pellentesque mattis elementum ut, laoreet non est. Sed vel nunc venenatis, interdum justo sit amet, ultrices diam. Vivamus pretium malesuada elit a venenatis. Duis at justo sit amet quam dictum consequat vel interdum felis. Phasellus lacinia lorem faucibus risus pretium cursus.

Vestibulum eu mi non sem tempor elementum. Etiam vitae ex dignissim, pharetra leo vel, scelerisque nisl. Ut faucibus ut lorem eget elementum. Phasellus ac condimentum sapien. Maecenas maximus vehicula lorem, vitae pellentesque lorem tincidunt eget. Sed ac justo nibh. Aenean ex risus, dignissim vitae accumsan vitae, vestibulum id dolor. Nam quis tortor auctor, dignissim sapien nec, malesuada turpis. Etiam ut enim in neque rhoncus suscipit sed ullamcorper ipsum. Integer sit amet tincidunt purus, eu venenatis tortor. Curabitur ac lobortis tortor. Nulla efficitur nec felis sed sagittis. Mauris feugiat orci quis egestas mollis. Integer hendrerit lacus non cursus finibus.
"""
	}
}
