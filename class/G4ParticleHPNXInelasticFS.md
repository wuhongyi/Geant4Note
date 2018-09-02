<!-- G4ParticleHPNXInelasticFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 09:47:41 2018 (+0800)
;; Last-Updated: 日 9月  2 09:49:34 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPNXInelasticFS

**public G4ParticleHPInelasticBaseFS**

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```

## class

```cpp
  public:
  
  G4ParticleHPNXInelasticFS(){}
  ~G4ParticleHPNXInelasticFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPNXInelasticFS * theNew = new G4ParticleHPNXInelasticFS;
   return theNew;
  }
  
  private:
```

<!-- G4ParticleHPNXInelasticFS.md ends here -->
