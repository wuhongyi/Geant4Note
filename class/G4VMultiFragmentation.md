<!-- G4VMultiFragmentation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:29:18 2018 (+0800)
;; Last-Updated: 六 9月  1 13:29:52 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VMultiFragmentation

Hadronic Process: Nuclear De-excitations

## class

```cpp
public:
  G4VMultiFragmentation();
  virtual ~G4VMultiFragmentation();
  
private:
  G4VMultiFragmentation(const G4VMultiFragmentation &right);
  
  const G4VMultiFragmentation & operator=(const G4VMultiFragmentation &right);
  G4bool operator==(const G4VMultiFragmentation &right) const;
  G4bool operator!=(const G4VMultiFragmentation &right) const;
  
public:
  virtual G4FragmentVector * BreakItUp(const G4Fragment &theNucleus) = 0;
```

<!-- G4VMultiFragmentation.md ends here -->
