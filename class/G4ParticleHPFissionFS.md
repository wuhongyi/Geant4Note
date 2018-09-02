<!-- G4ParticleHPFissionFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:37:13 2018 (+0800)
;; Last-Updated: 日 9月  2 10:50:05 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFissionFS

**public G4ParticleHPFinalState**

读取高精度参数

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* );
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```

- G4ParticleHPFSFissionFS
- G4ParticleHPFCFissionFS
- G4ParticleHPSCFissionFS
- G4ParticleHPTCFissionFS
- G4ParticleHPLCFissionFS
- G4ParticleHPFFFissionFS

## class

```cpp
  public:
  
  G4ParticleHPFissionFS(){ hasXsec = false; produceFissionFragments = false; }
  ~G4ParticleHPFissionFS(){}
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* );
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPFissionFS * theNew = new G4ParticleHPFissionFS;
   return theNew;
  }
        
  private:
  
  G4ParticleHPFSFissionFS theFS;
  G4ParticleHPFCFissionFS theFC;
  G4ParticleHPSCFissionFS theSC;
  G4ParticleHPTCFissionFS theTC;
  G4ParticleHPLCFissionFS theLC;
    
  G4ParticleHPFFFissionFS theFF;
  G4bool produceFissionFragments;
```

<!-- G4ParticleHPFissionFS.md ends here -->
