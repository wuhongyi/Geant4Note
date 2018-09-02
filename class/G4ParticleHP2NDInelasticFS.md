<!-- G4ParticleHP2NDInelasticFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 09:49:44 2018 (+0800)
;; Last-Updated: 日 9月  2 09:51:29 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHP2NDInelasticFS

**public G4ParticleHPInelasticBaseFS**

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```


## class

```cpp
  public:
  
  G4ParticleHP2NDInelasticFS(){}
  ~G4ParticleHP2NDInelasticFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHP2NDInelasticFS * theNew = new G4ParticleHP2NDInelasticFS;
   return theNew;
  }
  
  private:
```

<!-- G4ParticleHP2NDInelasticFS.md ends here -->
