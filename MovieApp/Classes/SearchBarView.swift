import UIKit
import SnapKit

class SearchBarView: UIView{

    private var textContainer: UIView!
    private var searchIcon: UIImageView!
    private var textField: UITextField!
    private var deleteEntryButton: UIButton!
    private var cancelButton: UIButton!
    public var delegate: SearchBarDelegate!
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createViews()
        styleViews()
        layout()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func createViews(){
        stackView = UIStackView()
        addSubview(stackView)
        textContainer = UIView()
        stackView.addArrangedSubview(textContainer)
        searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        textContainer.addSubview(searchIcon)
        textField = UITextField()
        textContainer.addSubview(textField)
        deleteEntryButton = UIButton()
        textContainer.addSubview(deleteEntryButton)
        cancelButton = UIButton()
        stackView.addArrangedSubview(cancelButton)
    }
    
    func styleViews(){
        
        textContainer.backgroundColor = Utils.hexStringToUIColor(hex: "#EAEAEB")
        textContainer.layer.cornerRadius = 10
        
        searchIcon.tintColor = Utils.hexStringToUIColor(hex: "#0B253F")
        
        textField.placeholder = "Search"
        textField.delegate = self
        textField.textColor = Utils.hexStringToUIColor(hex: "#0B253F")
        textField.font = UIFont(name: "ProximaNova-Regular", size: 16)
        textField.autocapitalizationType = .words
        
        deleteEntryButton.backgroundColor = .none
        deleteEntryButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteEntryButton.tintColor = Utils.hexStringToUIColor(hex: "#0B253F")
        deleteEntryButton.addTarget(self, action: #selector(self.deleteEntry), for: .touchUpInside)
        deleteEntryButton.isHidden = true
        
        cancelButton.backgroundColor = .none
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(Utils.hexStringToUIColor(hex: "#0B253F"), for: .normal)
        cancelButton.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
        cancelButton.isHidden = true
        
        stackView.spacing = 17
    }
    
    @objc
    func cancel(){
        textField.text = ""
        textField.endEditing(true)
        cancelButton.isHidden = true
        deleteEntryButton.isHidden = true
        delegate?.switchViews()
    }
    
    @objc
    func deleteEntry(){
        deleteEntryButton.isHidden = true
        textField.text = ""
    }
    
    func layout(){
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        textContainer.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchIcon.snp.makeConstraints{
            $0.height.width.equalTo(25)
            $0.leading.equalToSuperview().offset(13)
            $0.centerY.equalToSuperview()
        }
        
        textField.snp.makeConstraints{
            $0.leading.equalTo(searchIcon.snp.trailing).offset(9)
            $0.trailing.equalTo(deleteEntryButton).offset(9)
            $0.centerY.equalToSuperview()
        }
        
        deleteEntryButton.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.trailing.equalTo(textContainer.snp.trailing).inset(12)
            $0.centerY.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints{
            $0.leading.equalTo(textContainer.snp.trailing).offset(17)
        }
        
    }
}

extension SearchBarView: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.isHidden = false
        delegate?.switchViews()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        deleteEntryButton.isHidden = false

        if(range.lowerBound == 0 && range.upperBound > 0){
            deleteEntryButton.isHidden = true
        }
        
        return true
    }
}

protocol SearchBarDelegate{
    func switchViews()
}


