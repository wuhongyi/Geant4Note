<!-- G4EmModelActivator.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:14:57 2018 (+0800)
;; Last-Updated: 六 7月 14 02:53:11 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4EmModelActivator



## class


```cpp
public:

  explicit G4EmModelActivator(const G4String& emphys="");

private:

  void ActivatePAI();

  void ActivateMicroElec();

  void ActivateEmOptions();

  void FindOrAddProcess(const G4ParticleDefinition*, const G4String&);

  void AddStandardScattering(const G4ParticleDefinition*, G4EmConfigurator*,
                             G4VMscModel*, const G4String&, 
                             G4double, G4double);

  G4bool HasMsc(G4ProcessManager*) const;

  G4EmModelActivator & operator=(const G4EmModelActivator &right) = delete;
  G4EmModelActivator(const G4EmModelActivator&) = delete;
```


<!-- G4EmModelActivator.md ends here -->
