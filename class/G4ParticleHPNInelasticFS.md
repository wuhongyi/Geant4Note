<!-- G4ParticleHPNInelasticFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 00:04:34 2018 (+0800)
;; Last-Updated: 日 9月  2 00:07:02 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPNInelasticFS

**public G4ParticleHPInelasticCompFS**

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```

## class

```cpp
  public:
  
  G4ParticleHPNInelasticFS(){}
  ~G4ParticleHPNInelasticFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPNInelasticFS * theNew = new G4ParticleHPNInelasticFS;
   return theNew;
  }
  
  private:
```

<!-- G4ParticleHPNInelasticFS.md ends here -->
