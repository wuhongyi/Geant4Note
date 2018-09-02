<!-- Hadronic.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:18:51 2017 (+0800)
;; Last-Updated: 日 9月  2 12:37:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 11
;; URL: http://wuhongyi.cn -->

# Hadronic


![Hadronic Model Inventory](/img/HadronicModelInventory.png)

----

## 电子在 Si 上

截面数据 G4EMLOW7.3/microelec

- G4MicroElecCrossSectionDataSet.hh
- G4MicroElecElastic.hh
- G4MicroElecElasticModel.hh
	- Geant4 physics processes for microdosimetry simulation: very low energy electromagnetic models for electrons in Si, NIM B, vol. 288, pp. 66 - 73, 2012.
- G4MicroElecInelastic.hh
- G4MicroElecInelasticModel.hh
	- Inelastic cross-sections of low energy electrons in silicon for the simulation of heavy ion tracks with theGeant4-DNA toolkit, NSS Conf. Record 2010, pp. 80-85
	- Geant4 physics processes for microdosimetry simulation: very low energy electromagnetic models for electrons in Si, NIM B, vol. 288, pp. 66-73, 2012.
	- Geant4 physics processes for microdosimetry simulation: very low energy electromagnetic models for protons and heavy ions in Si, NIM B, vol. 287, pp. 124-129, 2012.


## neutron

- G4ChipsProtonElasticXS.hh
- G4ChipsNeutronElasticXS.hh
	- Short description: Interaction cross-sections for the elastic process. Class extracted from CHIPS and integrated in Geant4 by W.Pokorski
- G4ChipsProtonInelasticXS.hh
	- Short description: Cross-sections extracted (by W.Pokorski) from the CHIPS package for proton-nuclear interactions. Original author: M. Kossov
- G4ChipsNeutronInelasticXS.hh
	- Short description: Cross-sections extracted (by W.Pokorski) from the CHIPS package for neutron-nuclear interactions. Original author: M. Kossov

**Model  -- G4HadronicInteraction**

- G4HadronElastic.hh
	- Default model for elastic scattering; GHEISHA algorithm is used Class Description
- G4ChipsElasticModel.hh
	- Default model for elastic scattering; GHEISHA algorithm is used Class Description
	- CHIPS model of hadron elastic scattering
- G4DiffuseElastic.hh
	- G4 Model: optical diffuse elastic scattering with 4-momentum balance
	- Final state production model for hadron nuclear elastic scattering; 
	- 0.01 MeV - 1. TeV
- G4ParticleHPElastic.hh
	- Final state production model for a high precision (based on evaluated data libraries) description of neutron elastic scattering below 20 MeV; 
	- A prototype of the low energy neutron transport model.
	- 0. eV - 20. MeV
- G4LENDElastic.hh
	- LEND is Geant4 interface for GIDI (General Interaction Data Interface) which gives a discription of nuclear and atomic reactions, such as Binary collision cross sections / Particle number multiplicity distributions of reaction products / Energy and angular distributions of reaction products / Derived calculational constants
	- GIDI is developped at Lawrence Livermore National Laboratory


**Cross section**

- G4HadronElasticDataSet.hh(G4HadronCrossSections.hh) 这个可能就是自带的截面来源？？？
	- Baseline data-set for hadron nucleaus elastic cross-section. This does not need to be registered, but provides part of the general cross-section baseline
	- This class encapsulates cross section data and interpolations from the Geant3/Gheisha routine GHESIG.
- G4LENDElasticCrossSection.hh
- G4NeutronElasticXS.hh
	- This is a base class for neutron elastic hadronic cross section based on data files from G4NEUTRONXSDATA data set 
	- G4NEUTRONXS1.4  文件中第一列为能量 MeV，第二列为截面
- G4ParticleHPElasticData.hh
	- 高精度数据 < 20 MeV




<!-- Hadronic.md ends here -->
