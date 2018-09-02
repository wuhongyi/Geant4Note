<!-- G4ParticleHPFFFissionFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 11:29:47 2018 (+0800)
;; Last-Updated: 日 9月  2 11:33:51 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFFFissionFS

**public G4ParticleHPFissionBaseFS**

读取高精度参数

```cpp
      void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);

      G4DynamicParticleVector * ApplyYourself( G4int nNeutrons );
```

- "FF"



## class

```cpp
   public:
      G4ParticleHPFFFissionFS(){ hasXsec = false; }
      ~G4ParticleHPFFFissionFS();

      void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);

      G4DynamicParticleVector * ApplyYourself( G4int nNeutrons );

      G4ParticleHPFinalState * New() 
      {
         G4ParticleHPFFFissionFS * theNew = new G4ParticleHPFFFissionFS;
         return theNew;
      }

                              //energy   fragZ fragA   fragM
      void GetAFissionFragment( G4double , G4int& , G4int& , G4int& );
  
   private:
      G4HadFinalState * ApplyYourself( const G4HadProjectile & ) { return NULL; }

      //        MT              Energy            FPS    Yield
      std::map< G4int , std::map< G4double , std::map< G4int , G4double >* >* > FissionProductYieldData; 
      std::map< G4int , std::map< G4double , G4int >* > mMTInterpolation; 
```

<!-- G4ParticleHPFFFissionFS.md ends here -->
