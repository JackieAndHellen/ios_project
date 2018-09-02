# ios project
![img]https://github.com/JackieAndHellen/ios_project/blob/master/gif/Kapture%202018-09-02%20at%2023.41.37.gif?raw=true
```
func setViewHidden(ui: UIView){
    if ui.isHidden{
         ui.isHidden = !ui.isHidden;
    }else{
        UIView.animate(withDuration: 0.7){
            ui.isHidden = !ui.isHidden;
        }
    }
}
```

