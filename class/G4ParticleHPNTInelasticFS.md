<!-- G4ParticleHPNTInelasticFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:00:50 2018 (+0800)
;; Last-Updated: 日 9月  2 10:01:01 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPNTInelasticFS

**public G4ParticleHPInelasticBaseFS**

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```

## class

```cpp
  public:
  
  G4ParticleHPN3AInelasticFS(){}
  ~G4ParticleHPN3AInelasticFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPN3AInelasticFS * theNew = new G4ParticleHPN3AInelasticFS;
   return theNew;
  }
  
  private:
```


<!-- G4ParticleHPNTInelasticFS.md ends here -->
