<!-- G4ParticleHP3AInelasticFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:14:09 2018 (+0800)
;; Last-Updated: 日 9月  2 10:14:21 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHP3AInelasticFS

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


<!-- G4ParticleHP3AInelasticFS.md ends here -->
