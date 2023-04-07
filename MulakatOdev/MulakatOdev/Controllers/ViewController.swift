//
//  ViewController.swift
//  MulakatOdev
//
//  Created by kerem on 3.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate  {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Table view hücrelerinde yazdıracağımız metinler dizisi
    let brandArray = ["Audi", "Bmw", "Chrysler", "Fiat", "Honda", "Jaguar", "Lexus", "Mini", "Porsche", "Volkswagen", "Volvo"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        
        

    }
    

    
    
    //MARK: - Bu fonksiyon sayesinde scroll bar ım en üste geldiğinde navigation bar ımın gözükmemesini sağladım.
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
    }
    
    
    
    //    MARK: - Table viewa verileri yazdırmamı sağlayacak  fonksiyonlar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = brandArray[indexPath.row]
        cell.imageView?.image = UIImage(named: brandArray[indexPath.row])
        
        return cell
        
        
    }
    
    
    //MARK: - Burada table view un her bir hücre yüksekliğini 100 olarak ayarladık.
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    //    MARK: - Burada table view umuza "Markalar" başlığını ekledik
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .systemGray6
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: headerView.frame.width - 30, height: headerView.frame.height))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.text = "Markalar"
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
//    header ın yüksekliğini ayarladım.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
//    navigation bar ı gizleyince segue ile geçtiğimiz sayfadaki table view a geri dönme butonunu kaybetmemek için segue ile diğer view controller a geçerken geri dönmemizi sağlayacak butonu bu kodla geri getirdim.
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toAudi" ||
//            segue.identifier == "toBmw"  ||
//            segue.identifier == "toChrysler" ||
//            segue.identifier == "toFiat" ||
//            segue.identifier == "toHonda" ||
//            segue.identifier == "toJaguar" ||
//            segue.identifier == "toLexus" ||
//            segue.identifier == "toMini" ||
//            segue.identifier == "toPorsche" ||
//            segue.identifier == "toVolkswagen"
//        {
//            navigationController?.setNavigationBarHidden(false, animated: true)
//            }
//        }
    


//MARK: - Bu fonksiyonda table view un her bir hücresi tıklanması için ayrı bir segue ile ayrı bir ekrana yönlendirme yaptım.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
            vc.name = brandArray[indexPath.row]
            vc.image = UIImage(named: brandArray[indexPath.row])!
            //    MARK: - Dosyadan okuma
                
            if let fileURL = Bundle.main.url(forResource: brandArray[indexPath.row], withExtension: "txt") {
                    do {
                        let veri = try Data(contentsOf: fileURL)
                        if let metin = String(data: veri, encoding: .utf8) {
                            vc.text = metin
                            
                        }
                    } catch {
                        print("Dosya okunurken bir hata oluştu: \(error)")
                    }
                } else {
                    print("Dosya bulunamadı.")
                }
            tableView.deselectRow(at: indexPath, animated: true)
            self.navigationController?.pushViewController(vc, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
            
        
    }
    
    
}


