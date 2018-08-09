<!-- G4CrossSectionDataSetRegistry.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 03:49:46 2018 (+0800)
;; Last-Updated: 五 8月 10 03:56:01 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4CrossSectionDataSetRegistry

This is a singleton keeping pointers to all cross section data sets

```cpp
// Neeed for running with 'static' libraries to pull the references of the declared factories
G4_REFERENCE_XS_FACTORY(G4ChipsKaonMinusInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsKaonMinusElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsKaonPlusInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsKaonPlusElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsKaonZeroInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsKaonZeroElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsHyperonInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsHyperonElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsProtonInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsProtonElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsNeutronInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsNeutronElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsPionPlusInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsPionPlusElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsPionMinusInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsPionMinusElasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsAntiBaryonInelasticXS);
G4_REFERENCE_XS_FACTORY(G4ChipsAntiBaryonElasticXS);
G4_REFERENCE_XS_FACTORY(G4NucleonNuclearCrossSection);
G4_REFERENCE_XS_FACTORY(G4ElectroNuclearCrossSection);
G4_REFERENCE_XS_FACTORY(G4PhotoNuclearCrossSection);
G4_REFERENCE_XS_FACTORY(G4PiNuclearCrossSection);
G4_REFERENCE_XS_FACTORY(G4NeutronInelasticXS);
G4_REFERENCE_XS_FACTORY(G4NeutronElasticXS);
G4_REFERENCE_XS_FACTORY(G4NeutronCaptureXS);
```


## class

```cpp
friend class G4ThreadLocalSingleton<G4CrossSectionDataSetRegistry>;

public:

  static G4CrossSectionDataSetRegistry* Instance();
  // access 
  
  ~G4CrossSectionDataSetRegistry();
  
  void Register(G4VCrossSectionDataSet*);
  //register new cross section

  void DeRegister(G4VCrossSectionDataSet*);
  //deregister cross section

  void Clean();
  //clean the store
  
  //void AddFactory(G4String, G4VBaseXSFactory*);//AND

  G4VCrossSectionDataSet* GetCrossSectionDataSet(const G4String& name, 
						 G4bool warning=true);
    
private:

  G4CrossSectionDataSetRegistry();

  static G4ThreadLocal G4CrossSectionDataSetRegistry* instance;
  
  std::vector <G4VCrossSectionDataSet*> xSections;
```

<!-- G4CrossSectionDataSetRegistry.md ends here -->
