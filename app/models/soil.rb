class Soil < ActiveRecord::Base
  WRB98 = {
    'AC' => 'Acrisol',
    'AB' => 'Albeluvisol',
    'AL' => 'Alisol',
    'AN' => 'Andosol',
    'AT' => 'Anthrosol',
    'AR' => 'Arenosol',
    'CL' => 'Calcisol',
    'CM' => 'Cambisol',
    'CH' => 'Chernozem',
    'CR' => 'Cryosol',
    'DU' => 'Durisol',
    'FR' => 'Ferralsol',
    'FL' => 'Fluvisol',
    'GL' => 'Gleysol',
    'GY' => 'Gypsisol',
    'HS' => 'Histosol',
    'KS' => 'Kastanozem',
    'LP' => 'Leptosol',
    'LX' => 'Lixisol',
    'LV' => 'Luvisol',
    'NT' => 'Nitisol',
    'PH' => 'Phaeozem',
    'PL' => 'Planosol',
    'PT' => 'Plinthosol',
    'PZ' => 'Podzol',
    'RG' => 'Regosol',
    'SC' => 'Solonchak',
    'SN' => 'Solonetz',
    'UM' => 'Umbrisol',
    'VR' => 'Vertisol'    
  }
  DEFAULT_NAME = 'Site Soil'
  
  belongs_to :site
  has_many :soil_tests, :dependent => :destroy
  
  validates :name, :presence => true
  validates :wrb98_code, :inclusion => {:in => WRB98.keys}, :allow_blank => true
  
  def wrb98_name
    WRB98[wrb98_code] unless wrb98_code.blank?
  end
  
  def has_data?
    name != DEFAULT_NAME || ![wrb98_code, description].reject(&:blank?).empty?
  end
end
