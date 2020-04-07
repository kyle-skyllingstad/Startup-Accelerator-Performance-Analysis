
% This is a program for processing and analyzing quantitative and
% qualitative data for startups that may or may not have participated in a
% particular accelerator program. This analysis is to shed light on the
% effectiveness of the accelerator in boosting the companies' success on a
% variety of quantitative and qualitative metrics.


% Clear all data from program to create space for analysis.
clear all;

% Clear command window
clc;


%%%%%%%%%%%%%%%%%%%%%%%% Data Reading Section %%%%%%%%%%%%%%%%%%%%%%%%%%%

% Read excel file into MATLAB. This Excel file is a spreadsheet containing
% information for ninety startups, some of which partcipated in a
% particular accelerator program. Data was collected for each startup
% before and after the accerlator period, and company performance was
% assesed across this time for both companies that participated in the
% accelerator, and ones that did not. This was done across summer 2017
% (some comapnies participated in the 2017 accelerator cohort, some did
% not), and same for 2018. For the 2017 companies for instance, data was
% collected prior to the period when/if they participated in the
% accelerator program (spring 2017), and a year afterwards (spring 2018).
% For the 2017 cohort specifically, for companies that did and did not
% participate in the accelerator, data two years later (fall 2019) was also
% recorded and it was also used to shed further insight on the impact the
% accelerator had on company performance down the road.

% Data used in the quantitative analysis included but was not limited to:
% total investment raised, number of investors, number of emplyees, and
% number of board members.

% Qualtiative data included but was not limited to: business status
% (generating revenue, startup, out of business, etc.), investment stage,
% primary offering, and primary industry.





%%%%%%%%%%%%%%%%%%%%%%% Read in Startup Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%




% Read this master startup spreadsheet into MATLAB. num1 contains double
% values, txt1 contains text strings, and raw1 contains the unformatted
% "raw" file just after direct loading into MATLAB.
[num1,txt1,raw1] = xlsread('20191016FreeElectronsStartupSpreadsheet'); 





%%%%%%%%%%%%%%%%%%%%%%% Sort and Process Data %%%%%%%%%%%%%%%%%%%%%%%%%%%




% Sort through datasheet and extract data

% 2017 summer (spring 2017 to spring 2018)
% Set indices for counting accelerator (FE) data in one group, and
% non-accelerator (NFE) data in another. 
FEindex2017 = 0;
NFEindex2017 = 0;

% Sift through the 2017 portion of the data sheet.
for counter1 = 8:3:95
  
  % Count through FE data.  
  FE2017 = raw1{counter1-1,16};
  
  % For 2017, we have pre 2017 summer (spring) data, post 2017 summer
  % (fall) data, and two-years-later (fall 2019 or most recent) data. TI is
  % total investment.
  TIPreFE2017 = raw1{counter1,4};
  TIPostFE2017 = raw1{counter1-1,4};
  TIPostPostFE2017 = raw1{counter1+1,4};

  % Same data extracted for Number of Investors (Inv).
  InvPreFE2017 = raw1{counter1,5};
  InvPostFE2017 = raw1{counter1-1,5};
  InvPostPostFE2017 = raw1{counter1+1,5};
  
  % Same for Number of Employees (Emp).
  EmpPreFE2017 = raw1{counter1,7};
  EmpPostFE2017 = raw1{counter1-1,7};
  EmpPostPostFE2017 = raw1{counter1+1,7};
  
  % Same for Number of Board Members (Brd).
  BrdPreFE2017 = raw1{counter1,8};
  BrdPostFE2017 = raw1{counter1-1,8};
  BrdPostPostFE2017 = raw1{counter1+1,8};
  
  % Same for business status (BusStat). Extracting strings here.
  BusStatPreFE2017 = raw1{counter1,10};
  BusStatPostFE2017 = raw1{counter1-1,10};
  BusStatPostPostFE2017 = raw1{counter1+1,10};
  
  % Same for Investment Stage (Stage). 
  StagePreFE2017 = raw1{counter1,6};
  StagePostFE2017 = raw1{counter1-1,6};
  StagePostPostFE2017 = raw1{counter1+1,6};
  
  % Same for Primary Offering (Primary). 
  PrimaryPreFE2017 = raw1{counter1,9};
  PrimaryPostFE2017 = raw1{counter1-1,9};
  PrimaryPostPostFE2017 = raw1{counter1+1,9};
  
  % Same for Primary Industry (Industry). 
  IndustryPreFE2017 = raw1{counter1-1,14};
  IndustryPostFE2017 = raw1{counter1-1,14};
  IndustryPostPostFE2017 = raw1{counter1-1,14};
  
  % Sift through these data and sort them by whether or not the company
  % participated in the accelerator program during summer 2017.
  % If "yes"
  if FE2017 == 'Y'
      FEindex2017 = FEindex2017 + 1;
      TIFE2017pre{FEindex2017} = TIPreFE2017;
      TIFE2017post{FEindex2017} = TIPostFE2017;
      TIFE2017postpost{FEindex2017} = TIPostPostFE2017;
      InvFE2017pre{FEindex2017} = InvPreFE2017;
      InvFE2017post{FEindex2017} = InvPostFE2017;
      InvFE2017postpost{FEindex2017} = InvPostPostFE2017;
      EmpFE2017pre{FEindex2017} = EmpPreFE2017;
      EmpFE2017post{FEindex2017} = EmpPostFE2017;
      EmpFE2017postpost{FEindex2017} = EmpPostPostFE2017;
      BrdFE2017pre{FEindex2017} = BrdPreFE2017;
      BrdFE2017post{FEindex2017} = BrdPostFE2017;
      BrdFE2017postpost{FEindex2017} = BrdPostPostFE2017;
      BusStatFE2017pre{FEindex2017} = BusStatPreFE2017;
      BusStatFE2017post{FEindex2017} = BusStatPostFE2017;
      BusStatFE2017postpost{FEindex2017} = BusStatPostPostFE2017;
      StageFE2017pre{FEindex2017} = StagePreFE2017;
      StageFE2017post{FEindex2017} = StagePostFE2017;
      StageFE2017postpost{FEindex2017} = StagePostPostFE2017;
      PrimaryFE2017pre{FEindex2017} = PrimaryPreFE2017;
      PrimaryFE2017post{FEindex2017} = PrimaryPostFE2017;
      PrimaryFE2017postpost{FEindex2017} = PrimaryPostPostFE2017;
      IndustryFE2017pre{FEindex2017} = IndustryPreFE2017;
      IndustryFE2017post{FEindex2017} = IndustryPostFE2017;
      IndustryFE2017postpost{FEindex2017} = IndustryPostPostFE2017;
  
  % If "No"
  else
      NFEindex2017 = NFEindex2017 + 1;
      TINFE2017pre{NFEindex2017} = TIPreFE2017;
      TINFE2017post{NFEindex2017} = TIPostFE2017;
      TINFE2017postpost{NFEindex2017} = TIPostPostFE2017;
      InvNFE2017pre{NFEindex2017} = InvPreFE2017;
      InvNFE2017post{NFEindex2017} = InvPostFE2017;
      InvNFE2017postpost{NFEindex2017} = InvPostPostFE2017;
      EmpNFE2017pre{NFEindex2017} = EmpPreFE2017;
      EmpNFE2017post{NFEindex2017} = EmpPostFE2017;
      EmpNFE2017postpost{NFEindex2017} = EmpPostPostFE2017;
      BrdNFE2017pre{NFEindex2017} = BrdPreFE2017;
      BrdNFE2017post{NFEindex2017} = BrdPostFE2017;
      BrdNFE2017postpost{NFEindex2017} = BrdPostPostFE2017;
      BusStatNFE2017pre{NFEindex2017} = BusStatPreFE2017;
      BusStatNFE2017post{NFEindex2017} = BusStatPostFE2017;
      BusStatNFE2017postpost{NFEindex2017} = BusStatPostPostFE2017;
      StageNFE2017pre{NFEindex2017} = StagePreFE2017;
      StageNFE2017post{NFEindex2017} = StagePostFE2017;
      StageNFE2017postpost{NFEindex2017} = StagePostPostFE2017;
      PrimaryNFE2017pre{NFEindex2017} = PrimaryPreFE2017;
      PrimaryNFE2017post{NFEindex2017} = PrimaryPostFE2017;
      PrimaryNFE2017postpost{NFEindex2017} = PrimaryPostPostFE2017;
      IndustryNFE2017pre{NFEindex2017} = IndustryPreFE2017;
      IndustryNFE2017post{NFEindex2017} = IndustryPostFE2017;
      IndustryNFE2017postpost{NFEindex2017} = IndustryPostPostFE2017;
  end
  
    
    
end


% Sort through data page and extract data in the same manner, but for 2018.
% 2018
FEindex2018 = 0;
NFEindex2018 = 0;
for counter1 = 98:3:185
  
  % Raw data extracted
  FE2018 = raw1{counter1-1,16};
   
  % Begin sorting data into groups like before. 
  TIPreFE2018 = raw1{counter1,4};
  TIPostFE2018 = raw1{counter1-1,4};

  InvPreFE2018 = raw1{counter1,5};
  InvPostFE2018 = raw1{counter1-1,5};
  
  EmpPreFE2018 = raw1{counter1,7};
  EmpPostFE2018 = raw1{counter1-1,7};
  
  BrdPreFE2018 = raw1{counter1,8};
  BrdPostFE2018 = raw1{counter1-1,8};
  
  BusStatPreFE2018 = raw1{counter1,10};
  BusStatPostFE2018 = raw1{counter1-1,10};
  
  StagePreFE2018 = raw1{counter1,6};
  StagePostFE2018 = raw1{counter1-1,6};
  
  PrimaryPreFE2018 = raw1{counter1,9};
  PrimaryPostFE2018 = raw1{counter1-1,9};
  
  IndustryPreFE2018 = raw1{counter1-1,14};
  IndustryPostFE2018 = raw1{counter1-1,14};
  
  % Accelerator "Y"
  if FE2018 == 'Y'
      FEindex2018 = FEindex2018 + 1;
      TIFE2018pre{FEindex2018} = TIPreFE2018;
      TIFE2018post{FEindex2018} = TIPostFE2018;
      InvFE2018pre{FEindex2018} = InvPreFE2018;
      InvFE2018post{FEindex2018} = InvPostFE2018;
      EmpFE2018pre{FEindex2018} = EmpPreFE2018;
      EmpFE2018post{FEindex2018} = EmpPostFE2018;
      BrdFE2018pre{FEindex2018} = BrdPreFE2018;
      BrdFE2018post{FEindex2018} = BrdPostFE2018;
      BusStatFE2018pre{FEindex2018} = BusStatPreFE2018;
      BusStatFE2018post{FEindex2018} = BusStatPostFE2018;
      StageFE2018pre{FEindex2018} = StagePreFE2018;
      StageFE2018post{FEindex2018} = StagePostFE2018;
      PrimaryFE2018pre{FEindex2018} = PrimaryPreFE2018;
      PrimaryFE2018post{FEindex2018} = PrimaryPostFE2018;
      IndustryFE2018pre{FEindex2018} = IndustryPreFE2018;
      IndustryFE2018post{FEindex2018} = IndustryPostFE2018;
  
  % Accelerator "No"
  else
      NFEindex2018 = NFEindex2018 + 1;
      TINFE2018pre{NFEindex2018} = TIPreFE2018;
      TINFE2018post{NFEindex2018} = TIPostFE2018;
      InvNFE2018pre{NFEindex2018} = InvPreFE2018;
      InvNFE2018post{NFEindex2018} = InvPostFE2018;
      EmpNFE2018pre{NFEindex2018} = EmpPreFE2018;
      EmpNFE2018post{NFEindex2018} = EmpPostFE2018;
      BrdNFE2018pre{NFEindex2018} = BrdPreFE2018;
      BrdNFE2018post{NFEindex2018} = BrdPostFE2018;
      BusStatNFE2018pre{NFEindex2018} = BusStatPreFE2018;
      BusStatNFE2018post{NFEindex2018} = BusStatPostFE2018;
      StageNFE2018pre{NFEindex2018} = StagePreFE2018;
      StageNFE2018post{NFEindex2018} = StagePostFE2018;
      PrimaryNFE2018pre{NFEindex2018} = PrimaryPreFE2018;
      PrimaryNFE2018post{NFEindex2018} = PrimaryPostFE2018;
      IndustryNFE2018pre{NFEindex2018} = IndustryPreFE2018;
      IndustryNFE2018post{NFEindex2018} = IndustryPostFE2018;
  end
  
    
    
end


% convert each criterion to a column

% 2017

% Accelerator
TIFE2017pre = TIFE2017pre';
TIFE2017post = TIFE2017post';
TIFE2017postpost = TIFE2017postpost';
InvFE2017pre = InvFE2017pre';
InvFE2017post = InvFE2017post';
InvFE2017postpost = InvFE2017postpost';
EmpFE2017pre = EmpFE2017pre';
EmpFE2017post = EmpFE2017post';
EmpFE2017postpost = EmpFE2017postpost';
BrdFE2017pre = BrdFE2017pre';
BrdFE2017post = BrdFE2017post';
BrdFE2017postpost = BrdFE2017postpost';
BusStatFE2017pre = BusStatFE2017pre';
BusStatFE2017post = BusStatFE2017post';
BusStatFE2017postpost = BusStatFE2017postpost';
StageFE2017pre = StageFE2017pre';
StageFE2017post = StageFE2017post';
StageFE2017postpost = StageFE2017postpost';
PrimaryFE2017pre = PrimaryFE2017pre';
PrimaryFE2017post = PrimaryFE2017post';
PrimaryFE2017postpost = PrimaryFE2017postpost';
IndustryFE2017pre = IndustryFE2017pre';
IndustryFE2017post = IndustryFE2017post';
IndustryFE2017postpost = IndustryFE2017postpost';

% Non-Accelerator
TINFE2017pre = TINFE2017pre';
TINFE2017post = TINFE2017post';
TINFE2017postpost = TINFE2017postpost';
InvNFE2017pre = InvNFE2017pre';
InvNFE2017post = InvNFE2017post';
InvNFE2017postpost = InvNFE2017postpost';
EmpNFE2017pre = EmpNFE2017pre';
EmpNFE2017post = EmpNFE2017post';
EmpNFE2017postpost = EmpNFE2017postpost';
BrdNFE2017pre = BrdNFE2017pre';
BrdNFE2017post = BrdNFE2017post';
BrdNFE2017postpost = BrdNFE2017postpost';
BusStatNFE2017pre = BusStatNFE2017pre';
BusStatNFE2017post = BusStatNFE2017post';
BusStatNFE2017postpost = BusStatNFE2017postpost';
StageNFE2017pre = StageNFE2017pre';
StageNFE2017post = StageNFE2017post';
StageNFE2017postpost = StageNFE2017postpost';
PrimaryNFE2017pre = PrimaryNFE2017pre';
PrimaryNFE2017post = PrimaryNFE2017post';
PrimaryNFE2017postpost = PrimaryNFE2017postpost';
IndustryNFE2017pre = IndustryNFE2017pre';
IndustryNFE2017post = IndustryNFE2017post';
IndustryNFE2017postpost = IndustryNFE2017postpost';


% 2018

% Accelerator
TIFE2018pre = TIFE2018pre';
TIFE2018post = TIFE2018post';
InvFE2018pre = InvFE2018pre';
InvFE2018post = InvFE2018post';
EmpFE2018pre = EmpFE2018pre';
EmpFE2018post = EmpFE2018post';
BrdFE2018pre = BrdFE2018pre';
BrdFE2018post = BrdFE2018post';
BusStatFE2018pre = BusStatFE2018pre';
BusStatFE2018post = BusStatFE2018post';
StageFE2018pre = StageFE2018pre';
StageFE2018post = StageFE2018post';
PrimaryFE2018pre = PrimaryFE2018pre';
PrimaryFE2018post = PrimaryFE2018post';
IndustryFE2018pre = IndustryFE2018pre';
IndustryFE2018post = IndustryFE2018post';

% Non-Accelerator
TINFE2018pre = TINFE2018pre';
TINFE2018post = TINFE2018post';
InvNFE2018pre = InvNFE2018pre';
InvNFE2018post = InvNFE2018post';
EmpNFE2018pre = EmpNFE2018pre';
EmpNFE2018post = EmpNFE2018post';
BrdNFE2018pre = BrdNFE2018pre';
BrdNFE2018post = BrdNFE2018post';
BusStatNFE2018pre = BusStatNFE2018pre';
BusStatNFE2018post = BusStatNFE2018post';
StageNFE2018pre = StageNFE2018pre';
StageNFE2018post = StageNFE2018post';
PrimaryNFE2018pre = PrimaryNFE2018pre';
PrimaryNFE2018post = PrimaryNFE2018post';
IndustryNFE2018pre = IndustryNFE2018pre';
IndustryNFE2018post = IndustryNFE2018post';



% remove all '?'s and 'NaN's from strings to make text processible.
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TIFE2017pre); 
TIFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TIFE2017post); 
TIFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TIFE2017postpost); 
TIFE2017postpost(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TINFE2017pre); 
TINFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TINFE2017post); 
TINFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TINFE2017postpost); 
TINFE2017postpost(idx)=[];

idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TIFE2018pre); 
TIFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TIFE2018post); 
TIFE2018post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TINFE2018pre); 
TINFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),TINFE2018post); 
TINFE2018post(idx)=[];


idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvFE2017pre); 
InvFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvFE2017post); 
InvFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvFE2017postpost); 
InvFE2017postpost(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvNFE2017pre); 
InvNFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvNFE2017post); 
InvNFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvNFE2017postpost); 
InvNFE2017postpost(idx)=[];

idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvFE2018pre); 
InvFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvFE2018post); 
InvFE2018post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvNFE2018pre); 
InvNFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),InvNFE2018post); 
InvNFE2018post(idx)=[];


idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpFE2017pre); 
EmpFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpFE2017post); 
EmpFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpFE2017postpost); 
EmpFE2017postpost(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpNFE2017pre); 
EmpNFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpNFE2017post); 
EmpNFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpNFE2017postpost); 
EmpNFE2017postpost(idx)=[];

idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpFE2018pre); 
EmpFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpFE2018post); 
EmpFE2018post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpNFE2018pre); 
EmpNFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),EmpNFE2018post); 
EmpNFE2018post(idx)=[];


idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdFE2017pre); 
BrdFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdFE2017post); 
BrdFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdFE2017postpost); 
BrdFE2017postpost(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdNFE2017pre); 
BrdNFE2017pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdNFE2017post); 
BrdNFE2017post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdNFE2017postpost); 
BrdNFE2017postpost(idx)=[];

idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdFE2018pre); 
BrdFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdFE2018post); 
BrdFE2018post(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdNFE2018pre); 
BrdNFE2018pre(idx)=[];
idx=cellfun(@(x) isequal(x,'?') | isequal(x,'undisclosed'),BrdNFE2018post); 
BrdNFE2018post(idx)=[];




%%%%%%%%%%%%%%%%%%%%%%% Data Analytics Section %%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate averages and standard deviations for quantitative data (total
% investment raised to date, number of investors, number of employees, and
% number of board members) for the 2017 cohort (both ones that participated
% in the accelerator and ones that did not) before the cohort (spring
% 2017), after the cohort (spring 2018), and two years later (fall 2019 or
% most recent). 

% Calculate averages and standard deviations for quantitative data 2017 and
% 2018 cohorts.
meanTIFE2017pre = mean(cellfun(@mean,TIFE2017pre));
meanTIFE2017post = mean(cellfun(@mean,TIFE2017post));
meanTIFE2017postpost = mean(cellfun(@mean,TIFE2017postpost));
meanTINFE2017pre = mean(cellfun(@mean,TINFE2017pre));
meanTINFE2017post = mean(cellfun(@mean,TINFE2017post));
meanTINFE2017postpost = mean(cellfun(@mean,TINFE2017postpost));
sdevTIFE2017pre = std(cellfun(@mean,TIFE2017pre));
sdevTIFE2017post = std(cellfun(@mean,TIFE2017post));
sdevTIFE2017postpost = std(cellfun(@mean,TIFE2017postpost));
sdevTINFE2017pre = std(cellfun(@mean,TINFE2017pre));
sdevTINFE2017post = std(cellfun(@mean,TINFE2017post));
sdevTINFE2017postpost = std(cellfun(@mean,TINFE2017postpost));

meanTIFE2018pre = mean(cellfun(@mean,TIFE2018pre));
meanTIFE2018post = mean(cellfun(@mean,TIFE2018post));
meanTINFE2018pre = mean(cellfun(@mean,TINFE2018pre));
meanTINFE2018post = mean(cellfun(@mean,TINFE2018post));
sdevTIFE2018pre = std(cellfun(@mean,TIFE2018pre));
sdevTIFE2018post = std(cellfun(@mean,TIFE2018post));
sdevTINFE2018pre = std(cellfun(@mean,TINFE2018pre));
sdevTINFE2018post = std(cellfun(@mean,TINFE2018post));

meanInvFE2017pre = mean(cellfun(@mean,InvFE2017pre));
meanInvFE2017post = mean(cellfun(@mean,InvFE2017post));
meanInvFE2017postpost = mean(cellfun(@mean,InvFE2017postpost));
meanInvNFE2017pre = mean(cellfun(@mean,InvNFE2017pre));
meanInvNFE2017post = mean(cellfun(@mean,InvNFE2017post));
meanInvNFE2017postpost = mean(cellfun(@mean,InvNFE2017postpost));
sdevInvFE2017pre = std(cellfun(@mean,InvFE2017pre));
sdevInvFE2017post = std(cellfun(@mean,InvFE2017post));
sdevInvFE2017postpost = std(cellfun(@mean,InvFE2017postpost));
sdevInvNFE2017pre = std(cellfun(@mean,InvNFE2017pre));
sdevInvNFE2017post = std(cellfun(@mean,InvNFE2017post));
sdevInvNFE2017postpost = std(cellfun(@mean,InvNFE2017postpost));

meanInvFE2018pre = mean(cellfun(@mean,InvFE2018pre));
meanInvFE2018post = mean(cellfun(@mean,InvFE2018post));
meanInvNFE2018pre = mean(cellfun(@mean,InvNFE2018pre));
meanInvNFE2018post = mean(cellfun(@mean,InvNFE2018post));
sdevInvFE2018pre = std(cellfun(@mean,InvFE2018pre));
sdevInvFE2018post = std(cellfun(@mean,InvFE2018post));
sdevInvNFE2018pre = std(cellfun(@mean,InvNFE2018pre));
sdevInvNFE2018post = std(cellfun(@mean,InvNFE2018post));

meanEmpFE2017pre = mean(cellfun(@mean,EmpFE2017pre));
meanEmpFE2017post = mean(cellfun(@mean,EmpFE2017post));
meanEmpFE2017postpost = mean(cellfun(@mean,EmpFE2017postpost));
meanEmpNFE2017pre = mean(cellfun(@mean,EmpNFE2017pre));
meanEmpNFE2017post = mean(cellfun(@mean,EmpNFE2017post));
meanEmpNFE2017postpost = mean(cellfun(@mean,EmpNFE2017postpost));
sdevEmpFE2017pre = std(cellfun(@mean,EmpFE2017pre));
sdevEmpFE2017post = std(cellfun(@mean,EmpFE2017post));
sdevEmpFE2017postpost = std(cellfun(@mean,EmpFE2017postpost));
sdevEmpNFE2017pre = std(cellfun(@mean,EmpNFE2017pre));
sdevEmpNFE2017post = std(cellfun(@mean,EmpNFE2017post));
sdevEmpNFE2017postpost = std(cellfun(@mean,EmpNFE2017postpost));

meanEmpFE2018pre = mean(cellfun(@mean,EmpFE2018pre));
meanEmpFE2018post = mean(cellfun(@mean,EmpFE2018post));
meanEmpNFE2018pre = mean(cellfun(@mean,EmpNFE2018pre));
meanEmpNFE2018post = mean(cellfun(@mean,EmpNFE2018post));
sdevEmpFE2018pre = std(cellfun(@mean,EmpFE2018pre));
sdevEmpFE2018post = std(cellfun(@mean,EmpFE2018post));
sdevEmpNFE2018pre = std(cellfun(@mean,EmpNFE2018pre));
sdevEmpNFE2018post = std(cellfun(@mean,EmpNFE2018post));

meanBrdFE2017pre = mean(cellfun(@mean,BrdFE2017pre));
meanBrdFE2017post = mean(cellfun(@mean,BrdFE2017post));
meanBrdFE2017postpost = mean(cellfun(@mean,BrdFE2017postpost));
meanBrdNFE2017pre = mean(cellfun(@mean,BrdNFE2017pre));
meanBrdNFE2017post = mean(cellfun(@mean,BrdNFE2017post));
meanBrdNFE2017postpost = mean(cellfun(@mean,BrdNFE2017postpost));
sdevBrdFE2017pre = std(cellfun(@mean,BrdFE2017pre));
sdevBrdFE2017post = std(cellfun(@mean,BrdFE2017post));
sdevBrdFE2017postpost = std(cellfun(@mean,BrdFE2017postpost));
sdevBrdNFE2017pre = std(cellfun(@mean,BrdNFE2017pre));
sdevBrdNFE2017post = std(cellfun(@mean,BrdNFE2017post));
sdevBrdNFE2017postpost = std(cellfun(@mean,BrdNFE2017postpost));

meanBrdFE2018pre = mean(cellfun(@mean,BrdFE2018pre));
meanBrdFE2018post = mean(cellfun(@mean,BrdFE2018post));
meanBrdNFE2018pre = mean(cellfun(@mean,BrdNFE2018pre));
meanBrdNFE2018post = mean(cellfun(@mean,BrdNFE2018post));
sdevBrdFE2018pre = std(cellfun(@mean,BrdFE2018pre));
sdevBrdFE2018post = std(cellfun(@mean,BrdFE2018post));
sdevBrdNFE2018pre = std(cellfun(@mean,BrdNFE2018pre));
sdevBrdNFE2018post = std(cellfun(@mean,BrdNFE2018post));


% Sort 2017 data into rows. Six columns because of the two-years-later data
% available for accelerator and non-accelerator companies in the cohort.
dataTI2017 = [meanTIFE2017pre, meanTIFE2017post, meanTIFE2017postpost, ...
    meanTINFE2017pre, meanTINFE2017post, meanTINFE2017postpost];
dataInv2017 = [meanInvFE2017pre, meanInvFE2017post, ...
    meanInvFE2017postpost, meanInvNFE2017pre, meanInvNFE2017post, ...
    meanInvNFE2017postpost];
dataEmp2017 = [meanEmpFE2017pre, meanEmpFE2017post, ...
    meanEmpFE2017postpost, meanEmpNFE2017pre, meanEmpNFE2017post, ...
    meanEmpNFE2017postpost];
dataBrd2017 = [meanBrdFE2017pre, meanBrdFE2017post, ...
    meanBrdFE2017postpost, meanBrdNFE2017pre, meanBrdNFE2017post, ...
    meanBrdNFE2017postpost];

% Sort 2018 data into rows. Only four columns this time because
% two-years-later data (fall or spring 2020) is not available yet.
dataTI2018 = [meanTIFE2018pre, meanTIFE2018post, meanTINFE2018pre, ...
    meanTINFE2018post];
dataInv2018 = [meanInvFE2018pre, meanInvFE2018post, meanInvNFE2018pre, ...
    meanInvNFE2018post];
dataEmp2018 = [meanEmpFE2018pre, meanEmpFE2018post, meanEmpNFE2018pre, ...
    meanEmpNFE2018post];
dataBrd2018 = [meanBrdFE2018pre, meanBrdFE2018post, meanBrdNFE2018pre, ...
    meanBrdNFE2018post];

% Calculate percent changes in quantitative data for 2017.

% One year after
percentTIFE2017 = (meanTIFE2017post-meanTIFE2017pre)/meanTIFE2017pre;
percentTINFE2017 = (meanTINFE2017post-meanTINFE2017pre)/meanTINFE2017pre;
percentInvFE2017 = (meanInvFE2017post-meanInvFE2017pre)/meanInvFE2017pre;
percentInvNFE2017 = (meanInvNFE2017post-meanInvNFE2017pre)/meanInvNFE2017pre;
percentEmpFE2017 = (meanEmpFE2017post-meanEmpFE2017pre)/meanEmpFE2017pre;
percentEmpNFE2017 = (meanEmpNFE2017post-meanEmpNFE2017pre)/meanEmpNFE2017pre;
percentBrdFE2017 = (meanBrdFE2017post-meanBrdFE2017pre)/meanBrdFE2017pre;
percentBrdNFE2017 = (meanBrdNFE2017post-meanBrdNFE2017pre)/meanBrdNFE2017pre;

% Two years after
percent2TIFE2017 = (meanTIFE2017postpost-meanTIFE2017pre)/meanTIFE2017pre;
percent2TINFE2017 = (meanTINFE2017postpost-meanTINFE2017pre)/meanTINFE2017pre;
percent2InvFE2017 = (meanInvFE2017postpost-meanInvFE2017pre)/meanInvFE2017pre;
percent2InvNFE2017 = (meanInvNFE2017postpost-meanInvNFE2017pre)/meanInvNFE2017pre;
percent2EmpFE2017 = (meanEmpFE2017postpost-meanEmpFE2017pre)/meanEmpFE2017pre;
percent2EmpNFE2017 = (meanEmpNFE2017postpost-meanEmpNFE2017pre)/meanEmpNFE2017pre;
percent2BrdFE2017 = (meanBrdFE2017postpost-meanBrdFE2017pre)/meanBrdFE2017pre;
percent2BrdNFE2017 = (meanBrdNFE2017postpost-meanBrdNFE2017pre)/meanBrdNFE2017pre;


% 2018 percent changes

% One year after
percentTIFE2018 = (meanTIFE2018post-meanTIFE2018pre)/meanTIFE2018pre;
percentTINFE2018 = (meanTINFE2018post-meanTINFE2018pre)/meanTINFE2018pre;
percentInvFE2018 = (meanInvFE2018post-meanInvFE2018pre)/meanInvFE2018pre;
percentInvNFE2018 = (meanInvNFE2018post-meanInvNFE2018pre)/meanInvNFE2018pre;
percentEmpFE2018 = (meanEmpFE2018post-meanEmpFE2018pre)/meanEmpFE2018pre;
percentEmpNFE2018 = (meanEmpNFE2018post-meanEmpNFE2018pre)/meanEmpNFE2018pre;
percentBrdFE2018 = (meanBrdFE2018post-meanBrdFE2018pre)/meanBrdFE2018pre;
percentBrdNFE2018 = (meanBrdNFE2018post-meanBrdNFE2018pre)/meanBrdNFE2018pre;

% Sort and count the 2017 startups that partcipated in the accelerator
% program by business status. This is just before the accelerator period
% (spring 2017).
countBusStatFE2017pre = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatFE2017pre)
    if strcmp(BusStatFE2017pre{counter1},'Generating revenue')      
        countBusStatFE2017pre(1,1) = countBusStatFE2017pre(1,1) + 1;
    elseif strcmp(BusStatFE2017pre{counter1},'Profitable') 
        countBusStatFE2017pre(2,1) = countBusStatFE2017pre(2,1) + 1;
    elseif strcmp(BusStatFE2017pre{counter1},'Product in Beta Test') 
        countBusStatFE2017pre(3,1) = countBusStatFE2017pre(3,1) + 1;
    elseif strcmp(BusStatFE2017pre{counter1},'Startup') 
        countBusStatFE2017pre(4,1) = countBusStatFE2017pre(4,1) + 1;
    elseif strcmp(BusStatFE2017pre{counter1},'Out of Business') 
        countBusStatFE2017pre(5,1) = countBusStatFE2017pre(5,1) + 1;
    end
end

% Sort and count the 2017 startups that partcipated in the accelerator
% program by business status. This is one year after the accelerator period
% (spring 2018).
countBusStatFE2017post = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatFE2017post)
    if strcmp(BusStatFE2017post{counter1},'Generating revenue')      
        countBusStatFE2017post(1,1) = countBusStatFE2017post(1,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Profitable') 
        countBusStatFE2017post(2,1) = countBusStatFE2017post(2,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Product in Beta Test') 
        countBusStatFE2017post(3,1) = countBusStatFE2017post(3,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Startup') 
        countBusStatFE2017post(4,1) = countBusStatFE2017post(4,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Out of Business') 
        countBusStatFE2017post(5,1) = countBusStatFE2017post(5,1) + 1;
    end
end

% Verification of count for 2017 post-accelerator for participating
% startups.
countBusStatFE2017post = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatFE2017post)
    if strcmp(BusStatFE2017post{counter1},'Generating revenue')      
        countBusStatFE2017post(1,1) = countBusStatFE2017post(1,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Profitable') 
        countBusStatFE2017post(2,1) = countBusStatFE2017post(2,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Product in Beta Test') 
        countBusStatFE2017post(3,1) = countBusStatFE2017post(3,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Startup') 
        countBusStatFE2017post(4,1) = countBusStatFE2017post(4,1) + 1;
    elseif strcmp(BusStatFE2017post{counter1},'Out of Business') 
        countBusStatFE2017post(5,1) = countBusStatFE2017post(5,1) + 1;
    end
end

% Sort and count the 2017 startups that partcipated in the accelerator
% program by business status. This is 2 years after the accelerator period
% (fall/spring 2019).
countBusStatFE2017postpost = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatFE2017postpost)
    if strcmp(BusStatFE2017postpost{counter1},'Generating revenue')      
        countBusStatFE2017postpost(1,1) = countBusStatFE2017postpost(1,1) + 1;
    elseif strcmp(BusStatFE2017postpost{counter1},'Profitable') 
        countBusStatFE2017postpost(2,1) = countBusStatFE2017postpost(2,1) + 1;
    elseif strcmp(BusStatFE2017postpost{counter1},'Product in Beta Test') 
        countBusStatFE2017postpost(3,1) = countBusStatFE2017postpost(3,1) + 1;
    elseif strcmp(BusStatFE2017postpost{counter1},'Startup') 
        countBusStatFE2017postpost(4,1) = countBusStatFE2017postpost(4,1) + 1;
    elseif strcmp(BusStatFE2017postpost{counter1},'Out of Business') 
        countBusStatFE2017postpost(5,1) = countBusStatFE2017postpost(5,1) + 1;
    end
end

% Sort/count the 2017 startups that did NOT partcipate in the accelerator
% program by business status. This is just before the accelerator period
% (spring 2017).
countBusStatNFE2017pre = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatNFE2017pre)
    if strcmp(BusStatNFE2017pre{counter1},'Generating revenue')      
        countBusStatNFE2017pre(1,1) = countBusStatNFE2017pre(1,1) + 1;
    elseif strcmp(BusStatNFE2017pre{counter1},'Profitable') 
        countBusStatNFE2017pre(2,1) = countBusStatNFE2017pre(2,1) + 1;
    elseif strcmp(BusStatNFE2017pre{counter1},'Product in Beta Test') 
        countBusStatNFE2017pre(3,1) = countBusStatNFE2017pre(3,1) + 1;
    elseif strcmp(BusStatNFE2017pre{counter1},'Startup') 
        countBusStatNFE2017pre(4,1) = countBusStatNFE2017pre(4,1) + 1;
    elseif strcmp(BusStatNFE2017pre{counter1},'Out of Business') 
        countBusStatNFE2017pre(5,1) = countBusStatNFE2017pre(5,1) + 1;
    end
end

% Sort/count the 2017 startups that did NOT partcipate in the accelerator
% program by business status. This is one year after the accelerator period
% (spring 2018).
countBusStatNFE2017post = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatNFE2017post)
    if strcmp(BusStatNFE2017post{counter1},'Generating revenue')      
        countBusStatNFE2017post(1,1) = countBusStatNFE2017post(1,1) + 1;
    elseif strcmp(BusStatNFE2017post{counter1},'Profitable') 
        countBusStatNFE2017post(2,1) = countBusStatNFE2017post(2,1) + 1;
    elseif strcmp(BusStatNFE2017post{counter1},'Product in Beta Test') 
        countBusStatNFE2017post(3,1) = countBusStatNFE2017post(3,1) + 1;
    elseif strcmp(BusStatNFE2017post{counter1},'Startup') 
        countBusStatNFE2017post(4,1) = countBusStatNFE2017post(4,1) + 1;
    elseif strcmp(BusStatNFE2017post{counter1},'Out of Business') 
        countBusStatNFE2017post(5,1) = countBusStatNFE2017post(5,1) + 1;
    end
end

% Sort/count the 2017 startups that did NOT partcipate in the accelerator
% program by business status. This is 2 years after the accelerator period
% (fall/spring 2019).
countBusStatNFE2017postpost = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatNFE2017postpost)
    if strcmp(BusStatNFE2017postpost{counter1},'Generating revenue')      
        countBusStatNFE2017postpost(1,1) = countBusStatNFE2017postpost(1,1) + 1;
    elseif strcmp(BusStatNFE2017postpost{counter1},'Profitable') 
        countBusStatNFE2017postpost(2,1) = countBusStatNFE2017postpost(2,1) + 1;
    elseif strcmp(BusStatNFE2017postpost{counter1},'Product in Beta Test') 
        countBusStatNFE2017postpost(3,1) = countBusStatNFE2017postpost(3,1) + 1;
    elseif strcmp(BusStatNFE2017postpost{counter1},'Startup') 
        countBusStatNFE2017postpost(4,1) = countBusStatNFE2017postpost(4,1) + 1;
    elseif strcmp(BusStatNFE2017postpost{counter1},'Out of Business') 
        countBusStatNFE2017postpost(5,1) = countBusStatNFE2017postpost(5,1) + 1;
    end
end


% Sort/count the 2018 startups that did partcipate in the accelerator
% program by business status. This is just before the accelerator period
% (spring 2018).
countBusStatFE2018pre = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatFE2018pre)
    if strcmp(BusStatFE2018pre{counter1},'Generating Revenue')      
        countBusStatFE2018pre(1,1) = countBusStatFE2018pre(1,1) + 1;
    elseif strcmp(BusStatFE2018pre{counter1},'Profitable') 
        countBusStatFE2018pre(2,1) = countBusStatFE2018pre(2,1) + 1;
    elseif strcmp(BusStatFE2018pre{counter1},'Product in Beta Test') 
        countBusStatFE2018pre(3,1) = countBusStatFE2018pre(3,1) + 1;
    elseif strcmp(BusStatFE2018pre{counter1},'Startup') 
        countBusStatFE2018pre(4,1) = countBusStatFE2018pre(4,1) + 1;
    elseif strcmp(BusStatFE2018pre{counter1},'Out of Business') 
        countBusStatFE2018pre(5,1) = countBusStatFE2018pre(5,1) + 1;
    end
end

% Sort/count the 2018 startups that did partcipate in the accelerator
% program by business status. This is one year after the accelerator period
% (spring 2019).
countBusStatFE2018post = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatFE2018post)
    if strcmp(BusStatFE2018post{counter1},'Generating Revenue')      
        countBusStatFE2018post(1,1) = countBusStatFE2018post(1,1) + 1;
    elseif strcmp(BusStatFE2018post{counter1},'Profitable') 
        countBusStatFE2018post(2,1) = countBusStatFE2018post(2,1) + 1;
    elseif strcmp(BusStatFE2018post{counter1},'Product in Beta Test') 
        countBusStatFE2018post(3,1) = countBusStatFE2018post(3,1) + 1;
    elseif strcmp(BusStatFE2018post{counter1},'Startup') 
        countBusStatFE2018post(4,1) = countBusStatFE2018post(4,1) + 1;
    elseif strcmp(BusStatFE2018post{counter1},'Out of Business') 
        countBusStatFE2018post(5,1) = countBusStatFE2018post(5,1) + 1;
    end
end

% Sort/count the 2018 startups that did NOT partcipate in the accelerator
% program by business status. This is just before the accelerator period
% (spring 2018).
countBusStatNFE2018pre = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatNFE2018pre)
    if strcmp(BusStatNFE2018pre{counter1},'Generating Revenue')      
        countBusStatNFE2018pre(1,1) = countBusStatNFE2018pre(1,1) + 1;
    elseif strcmp(BusStatNFE2018pre{counter1},'Profitable') 
        countBusStatNFE2018pre(2,1) = countBusStatNFE2018pre(2,1) + 1;
    elseif strcmp(BusStatNFE2018pre{counter1},'Product in Beta Test') 
        countBusStatNFE2018pre(3,1) = countBusStatNFE2018pre(3,1) + 1;
    elseif strcmp(BusStatNFE2018pre{counter1},'Startup') 
        countBusStatNFE2018pre(4,1) = countBusStatNFE2018pre(4,1) + 1;
    elseif strcmp(BusStatNFE2018pre{counter1},'Out of Business') 
        countBusStatNFE2018pre(5,1) = countBusStatNFE2018pre(5,1) + 1;
    end
end

% Sort/count the 2018 startups that did NOT partcipate in the accelerator
% program by business status. This is one year after the accelerator period
% (spring 2019).
countBusStatNFE2018post = [0; 0; 0; 0; 0];
for counter1 = 1:length(BusStatNFE2018post)
    if strcmp(BusStatNFE2018post{counter1},'Generating Revenue')      
        countBusStatNFE2018post(1,1) = countBusStatNFE2018post(1,1) + 1;
    elseif strcmp(BusStatNFE2018post{counter1},'Profitable') 
        countBusStatNFE2018post(2,1) = countBusStatNFE2018post(2,1) + 1;
    elseif strcmp(BusStatNFE2018post{counter1},'Product in Beta Test') 
        countBusStatNFE2018post(3,1) = countBusStatNFE2018post(3,1) + 1;
    elseif strcmp(BusStatNFE2018post{counter1},'Startup') 
        countBusStatNFE2018post(4,1) = countBusStatNFE2018post(4,1) + 1;
    elseif strcmp(BusStatNFE2018post{counter1},'Out of Business') 
        countBusStatNFE2018post(5,1) = countBusStatNFE2018post(5,1) + 1;
    end
end

% Store 2017 and 2018 data in rows (6 cols. for 2017, 4 cols. for 2018).
dataBusStat2017 = [countBusStatFE2017pre, countBusStatFE2017post, ...
    countBusStatFE2017postpost, countBusStatNFE2017pre, ...
    countBusStatNFE2017post, countBusStatNFE2017postpost];
dataBusStat2018 = [countBusStatFE2018pre, countBusStatFE2018post, ...
    countBusStatNFE2018pre, countBusStatNFE2018post];


% Count primary offering data for 2017 and 2018 cohorts just as done for
% business status.

% Accelerator, 2017, pre
countPrimaryFE2017pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryFE2017pre)
    if strcmp(PrimaryFE2017pre{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryFE2017pre(1,1) = countPrimaryFE2017pre(1,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Energy Generation') 
        countPrimaryFE2017pre(2,1) = countPrimaryFE2017pre(2,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Energy Information & Management System') 
        countPrimaryFE2017pre(3,1) = countPrimaryFE2017pre(3,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Energy Storage') 
        countPrimaryFE2017pre(4,1) = countPrimaryFE2017pre(4,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'EV/Mobility') 
        countPrimaryFE2017pre(5,1) = countPrimaryFE2017pre(5,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Grid/Situational Awareness') 
        countPrimaryFE2017pre(6,1) = countPrimaryFE2017pre(6,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'IoT/Cybersecurity') 
        countPrimaryFE2017pre(7,1) = countPrimaryFE2017pre(7,1) + 1;    
    elseif strcmp(PrimaryFE2017pre{counter1},'N/A') 
        countPrimaryFE2017pre(8,1) = countPrimaryFE2017pre(8,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Predictive Maintenance') 
        countPrimaryFE2017pre(9,1) = countPrimaryFE2017pre(9,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Smart Home') 
        countPrimaryFE2017pre(10,1) = countPrimaryFE2017pre(10,1) + 1;
    elseif strcmp(PrimaryFE2017pre{counter1},'Trading Platform') 
        countPrimaryFE2017pre(11,1) = countPrimaryFE2017pre(11,1) + 1;
    end
end


% Accelerator, 2017, post one year
countPrimaryFE2017post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryFE2017post)
    if strcmp(PrimaryFE2017post{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryFE2017post(1,1) = countPrimaryFE2017post(1,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Energy Generation') 
        countPrimaryFE2017post(2,1) = countPrimaryFE2017post(2,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Energy Information & Management System') 
        countPrimaryFE2017post(3,1) = countPrimaryFE2017post(3,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Energy Storage') 
        countPrimaryFE2017post(4,1) = countPrimaryFE2017post(4,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'EV/Mobility') 
        countPrimaryFE2017post(5,1) = countPrimaryFE2017post(5,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Grid/Situational Awareness') 
        countPrimaryFE2017post(6,1) = countPrimaryFE2017post(6,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'IoT/Cybersecurity') 
        countPrimaryFE2017post(7,1) = countPrimaryFE2017post(7,1) + 1;    
    elseif strcmp(PrimaryFE2017post{counter1},'N/A') 
        countPrimaryFE2017post(8,1) = countPrimaryFE2017post(8,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Predictive Maintenance') 
        countPrimaryFE2017post(9,1) = countPrimaryFE2017post(9,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Smart Home') 
        countPrimaryFE2017post(10,1) = countPrimaryFE2017post(10,1) + 1;
    elseif strcmp(PrimaryFE2017post{counter1},'Trading Platform') 
        countPrimaryFE2017post(11,1) = countPrimaryFE2017post(11,1) + 1;
    end
end

% Accelerator, 2017, post two years
countPrimaryFE2017postpost = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryFE2017postpost)
    if strcmp(PrimaryFE2017postpost{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryFE2017postpost(1,1) = countPrimaryFE2017postpost(1,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Energy Generation') 
        countPrimaryFE2017postpost(2,1) = countPrimaryFE2017postpost(2,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Energy Information & Management System') 
        countPrimaryFE2017postpost(3,1) = countPrimaryFE2017postpost(3,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Energy Storage') 
        countPrimaryFE2017postpost(4,1) = countPrimaryFE2017postpost(4,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'EV/Mobility') 
        countPrimaryFE2017postpost(5,1) = countPrimaryFE2017postpost(5,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Grid/Situational Awareness') 
        countPrimaryFE2017postpost(6,1) = countPrimaryFE2017postpost(6,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'IoT/Cybersecurity') 
        countPrimaryFE2017postpost(7,1) = countPrimaryFE2017postpost(7,1) + 1;    
    elseif strcmp(PrimaryFE2017postpost{counter1},'N/A') 
        countPrimaryFE2017postpost(8,1) = countPrimaryFE2017postpost(8,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Predictive Maintenance') 
        countPrimaryFE2017postpost(9,1) = countPrimaryFE2017postpost(9,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Smart Home') 
        countPrimaryFE2017postpost(10,1) = countPrimaryFE2017postpost(10,1) + 1;
    elseif strcmp(PrimaryFE2017postpost{counter1},'Trading Platform') 
        countPrimaryFE2017postpost(11,1) = countPrimaryFE2017postpost(11,1) + 1;
    end
end

% Non-Accelerator, 2017, pre
countPrimaryNFE2017pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryNFE2017pre)
    if strcmp(PrimaryNFE2017pre{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryNFE2017pre(1,1) = countPrimaryNFE2017pre(1,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Energy Generation') 
        countPrimaryNFE2017pre(2,1) = countPrimaryNFE2017pre(2,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Energy Information & Management System') 
        countPrimaryNFE2017pre(3,1) = countPrimaryNFE2017pre(3,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Energy Storage') 
        countPrimaryNFE2017pre(4,1) = countPrimaryNFE2017pre(4,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'EV/Mobility') 
        countPrimaryNFE2017pre(5,1) = countPrimaryNFE2017pre(5,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Grid/Situational Awareness') 
        countPrimaryNFE2017pre(6,1) = countPrimaryNFE2017pre(6,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'IoT/Cybersecurity') 
        countPrimaryNFE2017pre(7,1) = countPrimaryNFE2017pre(7,1) + 1;    
    elseif strcmp(PrimaryNFE2017pre{counter1},'N/A') 
        countPrimaryNFE2017pre(8,1) = countPrimaryNFE2017pre(8,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Predictive Maintenance') 
        countPrimaryNFE2017pre(9,1) = countPrimaryNFE2017pre(9,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Smart Home') 
        countPrimaryNFE2017pre(10,1) = countPrimaryNFE2017pre(10,1) + 1;
    elseif strcmp(PrimaryNFE2017pre{counter1},'Trading Platform') 
        countPrimaryNFE2017pre(11,1) = countPrimaryNFE2017pre(11,1) + 1;
    end
end

% Non-Accelerator, 2017, post one year
countPrimaryNFE2017post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryNFE2017post)
    if strcmp(PrimaryNFE2017post{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryNFE2017post(1,1) = countPrimaryNFE2017post(1,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Energy Generation') 
        countPrimaryNFE2017post(2,1) = countPrimaryNFE2017post(2,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Energy Information & Management System') 
        countPrimaryNFE2017post(3,1) = countPrimaryNFE2017post(3,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Energy Storage') 
        countPrimaryNFE2017post(4,1) = countPrimaryNFE2017post(4,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'EV/Mobility') 
        countPrimaryNFE2017post(5,1) = countPrimaryNFE2017post(5,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Grid/Situational Awareness') 
        countPrimaryNFE2017post(6,1) = countPrimaryNFE2017post(6,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'IoT/Cybersecurity') 
        countPrimaryNFE2017post(7,1) = countPrimaryNFE2017post(7,1) + 1;    
    elseif strcmp(PrimaryNFE2017post{counter1},'N/A') 
        countPrimaryNFE2017post(8,1) = countPrimaryNFE2017post(8,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Predictive Maintenance') 
        countPrimaryNFE2017post(9,1) = countPrimaryNFE2017post(9,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Smart Home') 
        countPrimaryNFE2017post(10,1) = countPrimaryNFE2017post(10,1) + 1;
    elseif strcmp(PrimaryNFE2017post{counter1},'Trading Platform') 
        countPrimaryNFE2017post(11,1) = countPrimaryNFE2017post(11,1) + 1;
    end
end

% Non-Accelerator, 2017, post two years
countPrimaryNFE2017postpost = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryNFE2017postpost)
    if strcmp(PrimaryNFE2017postpost{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryNFE2017postpost(1,1) = countPrimaryNFE2017postpost(1,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Energy Generation') 
        countPrimaryNFE2017postpost(2,1) = countPrimaryNFE2017postpost(2,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Energy Information & Management System') 
        countPrimaryNFE2017postpost(3,1) = countPrimaryNFE2017postpost(3,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Energy Storage') 
        countPrimaryNFE2017postpost(4,1) = countPrimaryNFE2017postpost(4,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'EV/Mobility') 
        countPrimaryNFE2017postpost(5,1) = countPrimaryNFE2017postpost(5,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Grid/Situational Awareness') 
        countPrimaryNFE2017postpost(6,1) = countPrimaryNFE2017postpost(6,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'IoT/Cybersecurity') 
        countPrimaryNFE2017postpost(7,1) = countPrimaryNFE2017postpost(7,1) + 1;    
    elseif strcmp(PrimaryNFE2017postpost{counter1},'N/A') 
        countPrimaryNFE2017postpost(8,1) = countPrimaryNFE2017postpost(8,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Predictive Maintenance') 
        countPrimaryNFE2017postpost(9,1) = countPrimaryNFE2017postpost(9,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Smart Home') 
        countPrimaryNFE2017postpost(10,1) = countPrimaryNFE2017postpost(10,1) + 1;
    elseif strcmp(PrimaryNFE2017postpost{counter1},'Trading Platform') 
        countPrimaryNFE2017postpost(11,1) = countPrimaryNFE2017postpost(11,1) + 1;
    end
end


% Accelerator, 2018, pre
countPrimaryFE2018pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryFE2018pre)
    if strcmp(PrimaryFE2018pre{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryFE2018pre(1,1) = countPrimaryFE2018pre(1,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Energy Generation') 
        countPrimaryFE2018pre(2,1) = countPrimaryFE2018pre(2,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Energy Information & Management System') 
        countPrimaryFE2018pre(3,1) = countPrimaryFE2018pre(3,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Energy Storage') 
        countPrimaryFE2018pre(4,1) = countPrimaryFE2018pre(4,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'EV/Mobility') 
        countPrimaryFE2018pre(5,1) = countPrimaryFE2018pre(5,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Grid/Situational Awareness') 
        countPrimaryFE2018pre(6,1) = countPrimaryFE2018pre(6,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'IoT/Cybersecurity') 
        countPrimaryFE2018pre(7,1) = countPrimaryFE2018pre(7,1) + 1;    
    elseif strcmp(PrimaryFE2018pre{counter1},'N/A') 
        countPrimaryFE2018pre(8,1) = countPrimaryFE2018pre(8,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Predictive Maintenance') 
        countPrimaryFE2018pre(9,1) = countPrimaryFE2018pre(9,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Smart Home') 
        countPrimaryFE2018pre(10,1) = countPrimaryFE2018pre(10,1) + 1;
    elseif strcmp(PrimaryFE2018pre{counter1},'Trading Platform') 
        countPrimaryFE2018pre(11,1) = countPrimaryFE2018pre(11,1) + 1;
    end
end

% Accelerator, 2018, post one year
countPrimaryFE2018post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryFE2018post)
    if strcmp(PrimaryFE2018post{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryFE2018post(1,1) = countPrimaryFE2018post(1,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Energy Generation') 
        countPrimaryFE2018post(2,1) = countPrimaryFE2018post(2,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Energy Information & Management System') 
        countPrimaryFE2018post(3,1) = countPrimaryFE2018post(3,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Energy Storage') 
        countPrimaryFE2018post(4,1) = countPrimaryFE2018post(4,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'EV/Mobility') 
        countPrimaryFE2018post(5,1) = countPrimaryFE2018post(5,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Grid/Situational Awareness') 
        countPrimaryFE2018post(6,1) = countPrimaryFE2018post(6,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'IoT/Cybersecurity') 
        countPrimaryFE2018post(7,1) = countPrimaryFE2018post(7,1) + 1;    
    elseif strcmp(PrimaryFE2018post{counter1},'N/A') 
        countPrimaryFE2018post(8,1) = countPrimaryFE2018post(8,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Predictive Maintenance') 
        countPrimaryFE2018post(9,1) = countPrimaryFE2018post(9,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Smart Home') 
        countPrimaryFE2018post(10,1) = countPrimaryFE2018post(10,1) + 1;
    elseif strcmp(PrimaryFE2018post{counter1},'Trading Platform') 
        countPrimaryFE2018post(11,1) = countPrimaryFE2018post(11,1) + 1;
    end
end

% Non-Accelerator, 2018, pre
countPrimaryNFE2018pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryNFE2018pre)
    if strcmp(PrimaryNFE2018pre{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryNFE2018pre(1,1) = countPrimaryNFE2018pre(1,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Energy Generation') 
        countPrimaryNFE2018pre(2,1) = countPrimaryNFE2018pre(2,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Energy Information & Management System') 
        countPrimaryNFE2018pre(3,1) = countPrimaryNFE2018pre(3,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Energy Storage') 
        countPrimaryNFE2018pre(4,1) = countPrimaryNFE2018pre(4,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'EV/Mobility') 
        countPrimaryNFE2018pre(5,1) = countPrimaryNFE2018pre(5,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Grid/Situational Awareness') 
        countPrimaryNFE2018pre(6,1) = countPrimaryNFE2018pre(6,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'IoT/Cybersecurity') 
        countPrimaryNFE2018pre(7,1) = countPrimaryNFE2018pre(7,1) + 1;    
    elseif strcmp(PrimaryNFE2018pre{counter1},'N/A') 
        countPrimaryNFE2018pre(8,1) = countPrimaryNFE2018pre(8,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Predictive Maintenance') 
        countPrimaryNFE2018pre(9,1) = countPrimaryNFE2018pre(9,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Smart Home') 
        countPrimaryNFE2018pre(10,1) = countPrimaryNFE2018pre(10,1) + 1;
    elseif strcmp(PrimaryNFE2018pre{counter1},'Trading Platform') 
        countPrimaryNFE2018pre(11,1) = countPrimaryNFE2018pre(11,1) + 1;
    end
end

% Non-Accelerator, 2018, post one year
countPrimaryNFE2018post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(PrimaryNFE2018post)
    if strcmp(PrimaryNFE2018post{counter1},'Data Hosting Solutions for Co-Locating')      
        countPrimaryNFE2018post(1,1) = countPrimaryNFE2018post(1,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Energy Generation') 
        countPrimaryNFE2018post(2,1) = countPrimaryNFE2018post(2,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Energy Information & Management System') 
        countPrimaryNFE2018post(3,1) = countPrimaryNFE2018post(3,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Energy Storage') 
        countPrimaryNFE2018post(4,1) = countPrimaryNFE2018post(4,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'EV/Mobility') 
        countPrimaryNFE2018post(5,1) = countPrimaryNFE2018post(5,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Grid/Situational Awareness') 
        countPrimaryNFE2018post(6,1) = countPrimaryNFE2018post(6,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'IoT/Cybersecurity') 
        countPrimaryNFE2018post(7,1) = countPrimaryNFE2018post(7,1) + 1;    
    elseif strcmp(PrimaryNFE2018post{counter1},'N/A') 
        countPrimaryNFE2018post(8,1) = countPrimaryNFE2018post(8,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Predictive Maintenance') 
        countPrimaryNFE2018post(9,1) = countPrimaryNFE2018post(9,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Smart Home') 
        countPrimaryNFE2018post(10,1) = countPrimaryNFE2018post(10,1) + 1;
    elseif strcmp(PrimaryNFE2018post{counter1},'Trading Platform') 
        countPrimaryNFE2018post(11,1) = countPrimaryNFE2018post(11,1) + 1;
    end
end

% Store data in rows. There are 6 cols. for 2017, 4 cols. for 2018.
dataPrimary2017 = [countPrimaryFE2017pre, countPrimaryFE2017post, ...
    countPrimaryFE2017postpost, countPrimaryNFE2017pre, ...
    countPrimaryNFE2017post, countPrimaryNFE2017postpost];
dataPrimary2018 = [countPrimaryFE2018pre, countPrimaryFE2018post, ...
    countPrimaryNFE2018pre, countPrimaryNFE2018post];


% Count primary industry data for 2017 and 2018 cohorts just as done for
% business status and primary offering.

% Accelerator, 2017, pre
countIndustryFE2017pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryFE2017pre)
    if strcmp(IndustryFE2017pre{counter1},'Application Software')      
        countIndustryFE2017pre(1,1) = countIndustryFE2017pre(1,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Automation/Workflow Software') 
        countIndustryFE2017pre(2,1) = countIndustryFE2017pre(2,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Automotive') 
        countIndustryFE2017pre(3,1) = countIndustryFE2017pre(3,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Commercial Products') 
        countIndustryFE2017pre(4,1) = countIndustryFE2017pre(4,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Commercial Services') 
        countIndustryFE2017pre(5,1) = countIndustryFE2017pre(5,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Electrical Equipment') 
        countIndustryFE2017pre(6,1) = countIndustryFE2017pre(6,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Energy Infrastructure') 
        countIndustryFE2017pre(7,1) = countIndustryFE2017pre(7,1) + 1;    
    elseif strcmp(IndustryFE2017pre{counter1},'Energy Production') 
        countIndustryFE2017pre(8,1) = countIndustryFE2017pre(8,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Energy Storage') 
        countIndustryFE2017pre(9,1) = countIndustryFE2017pre(9,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Energy Traders and Brokers') 
        countIndustryFE2017pre(10,1) = countIndustryFE2017pre(10,1) + 1;
    elseif strcmp(IndustryFE2017pre{counter1},'Media and Information Services') 
        countIndustryFE2017pre(11,1) = countIndustryFE2017pre(11,1) + 1;
    end
end

% Accelerator, 2017, post one year
countIndustryFE2017post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryFE2017post)
    if strcmp(IndustryFE2017post{counter1},'Application Software')      
        countIndustryFE2017post(1,1) = countIndustryFE2017post(1,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Automation/Workflow Software') 
        countIndustryFE2017post(2,1) = countIndustryFE2017post(2,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Automotive') 
        countIndustryFE2017post(3,1) = countIndustryFE2017post(3,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Commercial Products') 
        countIndustryFE2017post(4,1) = countIndustryFE2017post(4,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Commercial Services') 
        countIndustryFE2017post(5,1) = countIndustryFE2017post(5,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Electrical Equipment') 
        countIndustryFE2017post(6,1) = countIndustryFE2017post(6,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Energy Infrastructure') 
        countIndustryFE2017post(7,1) = countIndustryFE2017post(7,1) + 1;    
    elseif strcmp(IndustryFE2017post{counter1},'Energy Production') 
        countIndustryFE2017post(8,1) = countIndustryFE2017post(8,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Energy Storage') 
        countIndustryFE2017post(9,1) = countIndustryFE2017post(9,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Energy Traders and Brokers') 
        countIndustryFE2017post(10,1) = countIndustryFE2017post(10,1) + 1;
    elseif strcmp(IndustryFE2017post{counter1},'Media and Information Services') 
        countIndustryFE2017post(11,1) = countIndustryFE2017post(11,1) + 1;
    end
end

% Accelerator, 2017, post two years
countIndustryFE2017postpost = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryFE2017postpost)
    if strcmp(IndustryFE2017postpost{counter1},'Application Software')      
        countIndustryFE2017postpost(1,1) = countIndustryFE2017postpost(1,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Automation/Workflow Software') 
        countIndustryFE2017postpost(2,1) = countIndustryFE2017postpost(2,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Automotive') 
        countIndustryFE2017postpost(3,1) = countIndustryFE2017postpost(3,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Commercial Products') 
        countIndustryFE2017postpost(4,1) = countIndustryFE2017postpost(4,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Commercial Services') 
        countIndustryFE2017postpost(5,1) = countIndustryFE2017postpost(5,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Electrical Equipment') 
        countIndustryFE2017postpost(6,1) = countIndustryFE2017postpost(6,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Energy Infrastructure') 
        countIndustryFE2017postpost(7,1) = countIndustryFE2017postpost(7,1) + 1;    
    elseif strcmp(IndustryFE2017postpost{counter1},'Energy Production') 
        countIndustryFE2017postpost(8,1) = countIndustryFE2017postpost(8,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Energy Storage') 
        countIndustryFE2017postpost(9,1) = countIndustryFE2017postpost(9,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Energy Traders and Brokers') 
        countIndustryFE2017postpost(10,1) = countIndustryFE2017postpost(10,1) + 1;
    elseif strcmp(IndustryFE2017postpost{counter1},'Media and Information Services') 
        countIndustryFE2017postpost(11,1) = countIndustryFE2017postpost(11,1) + 1;
    end
end

% Non-Accelerator, 2017, pre
countIndustryNFE2017pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryNFE2017pre)
    if strcmp(IndustryNFE2017pre{counter1},'Application Software')      
        countIndustryNFE2017pre(1,1) = countIndustryNFE2017pre(1,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Automation/Workflow Software') 
        countIndustryNFE2017pre(2,1) = countIndustryNFE2017pre(2,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Automotive') 
        countIndustryNFE2017pre(3,1) = countIndustryNFE2017pre(3,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Commercial Products') 
        countIndustryNFE2017pre(4,1) = countIndustryNFE2017pre(4,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Commercial Services') 
        countIndustryNFE2017pre(5,1) = countIndustryNFE2017pre(5,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Electrical Equipment') 
        countIndustryNFE2017pre(6,1) = countIndustryNFE2017pre(6,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Energy Infrastructure') 
        countIndustryNFE2017pre(7,1) = countIndustryNFE2017pre(7,1) + 1;    
    elseif strcmp(IndustryNFE2017pre{counter1},'Energy Production') 
        countIndustryNFE2017pre(8,1) = countIndustryNFE2017pre(8,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Energy Storage') 
        countIndustryNFE2017pre(9,1) = countIndustryNFE2017pre(9,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Energy Traders and Brokers') 
        countIndustryNFE2017pre(10,1) = countIndustryNFE2017pre(10,1) + 1;
    elseif strcmp(IndustryNFE2017pre{counter1},'Media and Information Services') 
        countIndustryNFE2017pre(11,1) = countIndustryNFE2017pre(11,1) + 1;
    end
end

% Non-Accelerator, 2017, post one year
countIndustryNFE2017post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryNFE2017post)
    if strcmp(IndustryNFE2017post{counter1},'Application Software')      
        countIndustryNFE2017post(1,1) = countIndustryNFE2017post(1,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Automation/Workflow Software') 
        countIndustryNFE2017post(2,1) = countIndustryNFE2017post(2,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Automotive') 
        countIndustryNFE2017post(3,1) = countIndustryNFE2017post(3,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Commercial Products') 
        countIndustryNFE2017post(4,1) = countIndustryNFE2017post(4,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Commercial Services') 
        countIndustryNFE2017post(5,1) = countIndustryNFE2017post(5,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Electrical Equipment') 
        countIndustryNFE2017post(6,1) = countIndustryNFE2017post(6,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Energy Infrastructure') 
        countIndustryNFE2017post(7,1) = countIndustryNFE2017post(7,1) + 1;    
    elseif strcmp(IndustryNFE2017post{counter1},'Energy Production') 
        countIndustryNFE2017post(8,1) = countIndustryNFE2017post(8,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Energy Storage') 
        countIndustryNFE2017post(9,1) = countIndustryNFE2017post(9,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Energy Traders and Brokers') 
        countIndustryNFE2017post(10,1) = countIndustryNFE2017post(10,1) + 1;
    elseif strcmp(IndustryNFE2017post{counter1},'Media and Information Services') 
        countIndustryNFE2017post(11,1) = countIndustryNFE2017post(11,1) + 1;
    end
end

% Non-Accelerator, 2017, post two years
countIndustryNFE2017postpost = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryNFE2017postpost)
    if strcmp(IndustryNFE2017postpost{counter1},'Application Software')      
        countIndustryNFE2017postpost(1,1) = countIndustryNFE2017postpost(1,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Automation/Workflow Software') 
        countIndustryNFE2017postpost(2,1) = countIndustryNFE2017postpost(2,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Automotive') 
        countIndustryNFE2017postpost(3,1) = countIndustryNFE2017postpost(3,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Commercial Products') 
        countIndustryNFE2017postpost(4,1) = countIndustryNFE2017postpost(4,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Commercial Services') 
        countIndustryNFE2017postpost(5,1) = countIndustryNFE2017postpost(5,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Electrical Equipment') 
        countIndustryNFE2017postpost(6,1) = countIndustryNFE2017postpost(6,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Energy Infrastructure') 
        countIndustryNFE2017postpost(7,1) = countIndustryNFE2017postpost(7,1) + 1;    
    elseif strcmp(IndustryNFE2017postpost{counter1},'Energy Production') 
        countIndustryNFE2017postpost(8,1) = countIndustryNFE2017postpost(8,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Energy Storage') 
        countIndustryNFE2017postpost(9,1) = countIndustryNFE2017postpost(9,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Energy Traders and Brokers') 
        countIndustryNFE2017postpost(10,1) = countIndustryNFE2017postpost(10,1) + 1;
    elseif strcmp(IndustryNFE2017postpost{counter1},'Media and Information Services') 
        countIndustryNFE2017postpost(11,1) = countIndustryNFE2017postpost(11,1) + 1;
    end
end

% Accelerator, 2018, pre
countIndustryFE2018pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryFE2018pre)
    if strcmp(IndustryFE2018pre{counter1},'Application Software')      
        countIndustryFE2018pre(1,1) = countIndustryFE2018pre(1,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Automation/Workflow Software') 
        countIndustryFE2018pre(2,1) = countIndustryFE2018pre(2,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Automotive') 
        countIndustryFE2018pre(3,1) = countIndustryFE2018pre(3,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Commercial Products') 
        countIndustryFE2018pre(4,1) = countIndustryFE2018pre(4,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Commercial Services') 
        countIndustryFE2018pre(5,1) = countIndustryFE2018pre(5,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Electrical Equipment') 
        countIndustryFE2018pre(6,1) = countIndustryFE2018pre(6,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Energy Infrastructure') 
        countIndustryFE2018pre(7,1) = countIndustryFE2018pre(7,1) + 1;    
    elseif strcmp(IndustryFE2018pre{counter1},'Energy Production') 
        countIndustryFE2018pre(8,1) = countIndustryFE2018pre(8,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Energy Storage') 
        countIndustryFE2018pre(9,1) = countIndustryFE2018pre(9,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Energy Traders and Brokers') 
        countIndustryFE2018pre(10,1) = countIndustryFE2018pre(10,1) + 1;
    elseif strcmp(IndustryFE2018pre{counter1},'Media and Information Services') 
        countIndustryFE2018pre(11,1) = countIndustryFE2018pre(11,1) + 1;
    end
end

% Accelerator, 2018, post one year
countIndustryFE2018post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryFE2018post)
    if strcmp(IndustryFE2018post{counter1},'Application Software')      
        countIndustryFE2018post(1,1) = countIndustryFE2018post(1,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Automation/Workflow Software') 
        countIndustryFE2018post(2,1) = countIndustryFE2018post(2,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Automotive') 
        countIndustryFE2018post(3,1) = countIndustryFE2018post(3,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Commercial Products') 
        countIndustryFE2018post(4,1) = countIndustryFE2018post(4,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Commercial Services') 
        countIndustryFE2018post(5,1) = countIndustryFE2018post(5,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Electrical Equipment') 
        countIndustryFE2018post(6,1) = countIndustryFE2018post(6,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Energy Infrastructure') 
        countIndustryFE2018post(7,1) = countIndustryFE2018post(7,1) + 1;    
    elseif strcmp(IndustryFE2018post{counter1},'Energy Production') 
        countIndustryFE2018post(8,1) = countIndustryFE2018post(8,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Energy Storage') 
        countIndustryFE2018post(9,1) = countIndustryFE2018post(9,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Energy Traders and Brokers') 
        countIndustryFE2018post(10,1) = countIndustryFE2018post(10,1) + 1;
    elseif strcmp(IndustryFE2018post{counter1},'Media and Information Services') 
        countIndustryFE2018post(11,1) = countIndustryFE2018post(11,1) + 1;
    end
end

% Non-Accelerator, 2018, pre
countIndustryNFE2018pre = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryNFE2018pre)
    if strcmp(IndustryNFE2018pre{counter1},'Application Software')      
        countIndustryNFE2018pre(1,1) = countIndustryNFE2018pre(1,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Automation/Workflow Software') 
        countIndustryNFE2018pre(2,1) = countIndustryNFE2018pre(2,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Automotive') 
        countIndustryNFE2018pre(3,1) = countIndustryNFE2018pre(3,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Commercial Products') 
        countIndustryNFE2018pre(4,1) = countIndustryNFE2018pre(4,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Commercial Services') 
        countIndustryNFE2018pre(5,1) = countIndustryNFE2018pre(5,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Electrical Equipment') 
        countIndustryNFE2018pre(6,1) = countIndustryNFE2018pre(6,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Energy Infrastructure') 
        countIndustryNFE2018pre(7,1) = countIndustryNFE2018pre(7,1) + 1;    
    elseif strcmp(IndustryNFE2018pre{counter1},'Energy Production') 
        countIndustryNFE2018pre(8,1) = countIndustryNFE2018pre(8,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Energy Storage') 
        countIndustryNFE2018pre(9,1) = countIndustryNFE2018pre(9,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Energy Traders and Brokers') 
        countIndustryNFE2018pre(10,1) = countIndustryNFE2018pre(10,1) + 1;
    elseif strcmp(IndustryNFE2018pre{counter1},'Media and Information Services') 
        countIndustryNFE2018pre(11,1) = countIndustryNFE2018pre(11,1) + 1;
    end
end

% Non-Accelerator, 2018, post one year
countIndustryNFE2018post = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(IndustryNFE2018post)
    if strcmp(IndustryNFE2018post{counter1},'Application Software')      
        countIndustryNFE2018post(1,1) = countIndustryNFE2018post(1,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Automation/Workflow Software') 
        countIndustryNFE2018post(2,1) = countIndustryNFE2018post(2,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Automotive') 
        countIndustryNFE2018post(3,1) = countIndustryNFE2018post(3,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Commercial Products') 
        countIndustryNFE2018post(4,1) = countIndustryNFE2018post(4,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Commercial Services') 
        countIndustryNFE2018post(5,1) = countIndustryNFE2018post(5,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Electrical Equipment') 
        countIndustryNFE2018post(6,1) = countIndustryNFE2018post(6,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Energy Infrastructure') 
        countIndustryNFE2018post(7,1) = countIndustryNFE2018post(7,1) + 1;    
    elseif strcmp(IndustryNFE2018post{counter1},'Energy Production') 
        countIndustryNFE2018post(8,1) = countIndustryNFE2018post(8,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Energy Storage') 
        countIndustryNFE2018post(9,1) = countIndustryNFE2018post(9,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Energy Traders and Brokers') 
        countIndustryNFE2018post(10,1) = countIndustryNFE2018post(10,1) + 1;
    elseif strcmp(IndustryNFE2018post{counter1},'Media and Information Services') 
        countIndustryNFE2018post(11,1) = countIndustryNFE2018post(11,1) + 1;
    end
end

% Store into rows. There are 6 cols. for 2017, and 4 cols. for 2018.
dataIndustry2017 = [countIndustryFE2017pre, countIndustryFE2017post, ...
    countIndustryFE2017postpost, countIndustryNFE2017pre, ...
    countIndustryNFE2017post, countIndustryNFE2017postpost];
dataIndustry2018 = [countIndustryFE2018pre, countIndustryFE2018post, ...
    countIndustryNFE2018pre, countIndustryNFE2018post];




% Count investment stage data for 2017 and 2018 cohorts just as done for
% the other qualitative categories.

% Accelerator, 2017, pre
countStageFE2017pre = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageFE2017pre)
    if strcmp(StageFE2017pre{counter1},'Accelerator/Incubator')      
        countStageFE2017pre(1,1) = countStageFE2017pre(1,1) + 1;
    elseif contains(StageFE2017pre{counter1},'Seed') 
        countStageFE2017pre(2,1) = countStageFE2017pre(2,1) + 1;
    elseif contains(StageFE2017pre{counter1},'VC') 
        countStageFE2017pre(3,1) = countStageFE2017pre(3,1) + 1;
    elseif strcmp(StageFE2017pre{counter1},'Angel') 
        countStageFE2017pre(4,1) = countStageFE2017pre(4,1) + 1;
    elseif strcmp(StageFE2017pre{counter1},'Grant') 
        countStageFE2017pre(5,1) = countStageFE2017pre(5,1) + 1;
    elseif strcmp(StageFE2017pre{counter1},'Corporate') 
        countStageFE2017pre(6,1) = countStageFE2017pre(6,1) + 1;
    elseif strcmp(StageFE2017pre{counter1},'Merger') 
        countStageFE2017pre(7,1) = countStageFE2017pre(7,1) + 1;
    elseif strcmp(StageFE2017pre{counter1},'Debt') 
        countStageFE2017pre(8,1) = countStageFE2017pre(8,1) + 1;
    end
end

% Accelerator, 2017, post one year
countStageFE2017post = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageFE2017post)
    if strcmp(StageFE2017post{counter1},'Accelerator/Incubator')      
        countStageFE2017post(1,1) = countStageFE2017post(1,1) + 1;
    elseif contains(StageFE2017post{counter1},'Seed') 
        countStageFE2017post(2,1) = countStageFE2017post(2,1) + 1;
    elseif contains(StageFE2017post{counter1},'VC') 
        countStageFE2017post(3,1) = countStageFE2017post(3,1) + 1;
    elseif strcmp(StageFE2017post{counter1},'Angel') 
        countStageFE2017post(4,1) = countStageFE2017post(4,1) + 1;
    elseif strcmp(StageFE2017post{counter1},'Grant') 
        countStageFE2017post(5,1) = countStageFE2017post(5,1) + 1;
    elseif strcmp(StageFE2017post{counter1},'Corporate') 
        countStageFE2017post(6,1) = countStageFE2017post(6,1) + 1;
    elseif strcmp(StageFE2017post{counter1},'Merger') 
        countStageFE2017post(7,1) = countStageFE2017post(7,1) + 1;
    elseif strcmp(StageFE2017post{counter1},'Debt') 
        countStageFE2017post(8,1) = countStageFE2017post(8,1) + 1;
    end
end

% Accelerator, 2017, post two years
countStageFE2017postpost = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageFE2017postpost)
    if strcmp(StageFE2017postpost{counter1},'Accelerator/Incubator')      
        countStageFE2017postpost(1,1) = countStageFE2017postpost(1,1) + 1;
    elseif contains(StageFE2017postpost{counter1},'Seed') 
        countStageFE2017postpost(2,1) = countStageFE2017postpost(2,1) + 1;
    elseif contains(StageFE2017postpost{counter1},'VC') 
        countStageFE2017postpost(3,1) = countStageFE2017postpost(3,1) + 1;
    elseif strcmp(StageFE2017postpost{counter1},'Angel') 
        countStageFE2017postpost(4,1) = countStageFE2017postpost(4,1) + 1;
    elseif strcmp(StageFE2017postpost{counter1},'Grant') 
        countStageFE2017postpost(5,1) = countStageFE2017postpost(5,1) + 1;
    elseif strcmp(StageFE2017postpost{counter1},'Corporate') 
        countStageFE2017postpost(6,1) = countStageFE2017postpost(6,1) + 1;
    elseif strcmp(StageFE2017postpost{counter1},'Merger') 
        countStageFE2017postpost(7,1) = countStageFE2017postpost(7,1) + 1;
    elseif strcmp(StageFE2017postpost{counter1},'Debt') 
        countStageFE2017postpost(8,1) = countStageFE2017postpost(8,1) + 1;
    end
end

% Non-Accelerator, 2017, pre
countStageNFE2017pre = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageNFE2017pre)
    if strcmp(StageNFE2017pre{counter1},'Accelerator/Incubator')      
        countStageNFE2017pre(1,1) = countStageNFE2017pre(1,1) + 1;
    elseif contains(StageNFE2017pre{counter1},'Seed') 
        countStageNFE2017pre(2,1) = countStageNFE2017pre(2,1) + 1;
    elseif contains(StageNFE2017pre{counter1},'VC') 
        countStageNFE2017pre(3,1) = countStageNFE2017pre(3,1) + 1;
    elseif strcmp(StageNFE2017pre{counter1},'Angel') 
        countStageNFE2017pre(4,1) = countStageNFE2017pre(4,1) + 1;
    elseif strcmp(StageNFE2017pre{counter1},'Grant') 
        countStageNFE2017pre(5,1) = countStageNFE2017pre(5,1) + 1;
    elseif strcmp(StageNFE2017pre{counter1},'Corporate') 
        countStageNFE2017pre(6,1) = countStageNFE2017pre(6,1) + 1;
    elseif strcmp(StageNFE2017pre{counter1},'Merger') 
        countStageNFE2017pre(7,1) = countStageNFE2017pre(7,1) + 1;
    elseif strcmp(StageNFE2017pre{counter1},'Debt') 
        countStageNFE2017pre(8,1) = countStageNFE2017pre(8,1) + 1;
    end
end

% Non-Accelerator, 2017, post one year
countStageNFE2017post = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageNFE2017post)
    if strcmp(StageNFE2017post{counter1},'Accelerator/Incubator')      
        countStageNFE2017post(1,1) = countStageNFE2017post(1,1) + 1;
    elseif contains(StageNFE2017post{counter1},'Seed') 
        countStageNFE2017post(2,1) = countStageNFE2017post(2,1) + 1;
    elseif contains(StageNFE2017post{counter1},'VC') 
        countStageNFE2017post(3,1) = countStageNFE2017post(3,1) + 1;
    elseif strcmp(StageNFE2017post{counter1},'Angel') 
        countStageNFE2017post(4,1) = countStageNFE2017post(4,1) + 1;
    elseif strcmp(StageNFE2017post{counter1},'Grant') 
        countStageNFE2017post(5,1) = countStageNFE2017post(5,1) + 1;
    elseif strcmp(StageNFE2017post{counter1},'Corporate') 
        countStageNFE2017post(6,1) = countStageNFE2017post(6,1) + 1;
    elseif strcmp(StageNFE2017post{counter1},'Merger') 
        countStageNFE2017post(7,1) = countStageNFE2017post(7,1) + 1;
    elseif strcmp(StageNFE2017post{counter1},'Debt') 
        countStageNFE2017post(8,1) = countStageNFE2017post(8,1) + 1;
    end
end

% Non-Accelerator, 2017, post two years
countStageNFE2017postpost = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageNFE2017postpost)
    if strcmp(StageNFE2017postpost{counter1},'Accelerator/Incubator')      
        countStageNFE2017postpost(1,1) = countStageNFE2017postpost(1,1) + 1;
    elseif contains(StageNFE2017postpost{counter1},'Seed') 
        countStageNFE2017postpost(2,1) = countStageNFE2017postpost(2,1) + 1;
    elseif contains(StageNFE2017postpost{counter1},'VC') 
        countStageNFE2017postpost(3,1) = countStageNFE2017postpost(3,1) + 1;
    elseif strcmp(StageNFE2017postpost{counter1},'Angel') 
        countStageNFE2017postpost(4,1) = countStageNFE2017postpost(4,1) + 1;
    elseif strcmp(StageNFE2017postpost{counter1},'Grant') 
        countStageNFE2017postpost(5,1) = countStageNFE2017postpost(5,1) + 1;
    elseif strcmp(StageNFE2017postpost{counter1},'Corporate') 
        countStageNFE2017postpost(6,1) = countStageNFE2017postpost(6,1) + 1;
    elseif strcmp(StageNFE2017postpost{counter1},'Merger') 
        countStageNFE2017postpost(7,1) = countStageNFE2017postpost(7,1) + 1;
    elseif strcmp(StageNFE2017postpost{counter1},'Debt') 
        countStageNFE2017postpost(8,1) = countStageNFE2017postpost(8,1) + 1;
    end
end

% Accelerator, 2018, pre
countStageFE2018pre = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageFE2018pre)
    if strcmp(StageFE2018pre{counter1},'Accelerator/Incubator')      
        countStageFE2018pre(1,1) = countStageFE2018pre(1,1) + 1;
    elseif contains(StageFE2018pre{counter1},'Seed') 
        countStageFE2018pre(2,1) = countStageFE2018pre(2,1) + 1;
    elseif contains(StageFE2018pre{counter1},'VC') 
        countStageFE2018pre(3,1) = countStageFE2018pre(3,1) + 1;
    elseif strcmp(StageFE2018pre{counter1},'Angel') 
        countStageFE2018pre(4,1) = countStageFE2018pre(4,1) + 1;
    elseif strcmp(StageFE2018pre{counter1},'Grant') 
        countStageFE2018pre(5,1) = countStageFE2018pre(5,1) + 1;
    elseif strcmp(StageFE2018pre{counter1},'Corporate') 
        countStageFE2018pre(6,1) = countStageFE2018pre(6,1) + 1;
    elseif strcmp(StageFE2018pre{counter1},'Merger') 
        countStageFE2018pre(7,1) = countStageFE2018pre(7,1) + 1;
    elseif strcmp(StageFE2018pre{counter1},'Debt') 
        countStageFE2018pre(8,1) = countStageFE2018pre(8,1) + 1;
    end
end

% Accelerator, 2018, post one year
countStageFE2018post = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageFE2018post)
    if strcmp(StageFE2018post{counter1},'Accelerator/Incubator')      
        countStageFE2018post(1,1) = countStageFE2018post(1,1) + 1;
    elseif contains(StageFE2018post{counter1},'Seed') 
        countStageFE2018post(2,1) = countStageFE2018post(2,1) + 1;
    elseif contains(StageFE2018post{counter1},'VC') 
        countStageFE2018post(3,1) = countStageFE2018post(3,1) + 1;
    elseif strcmp(StageFE2018post{counter1},'Angel') 
        countStageFE2018post(4,1) = countStageFE2018post(4,1) + 1;
    elseif strcmp(StageFE2018post{counter1},'Grant') 
        countStageFE2018post(5,1) = countStageFE2018post(5,1) + 1;
    elseif strcmp(StageFE2018post{counter1},'Corporate') 
        countStageFE2018post(6,1) = countStageFE2018post(6,1) + 1;
    elseif strcmp(StageFE2018post{counter1},'Merger') 
        countStageFE2018post(7,1) = countStageFE2018post(7,1) + 1;
    elseif strcmp(StageFE2018post{counter1},'Debt') 
        countStageFE2018post(8,1) = countStageFE2018post(8,1) + 1;
    end
end

% Non-Accelerator, 2018, pre
countStageNFE2018pre = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageNFE2018pre)
    if strcmp(StageNFE2018pre{counter1},'Accelerator/Incubator')      
        countStageNFE2018pre(1,1) = countStageNFE2018pre(1,1) + 1;
    elseif contains(StageNFE2018pre{counter1},'Seed') 
        countStageNFE2018pre(2,1) = countStageNFE2018pre(2,1) + 1;
    elseif contains(StageNFE2018pre{counter1},'VC') 
        countStageNFE2018pre(3,1) = countStageNFE2018pre(3,1) + 1;
    elseif strcmp(StageNFE2018pre{counter1},'Angel') 
        countStageNFE2018pre(4,1) = countStageNFE2018pre(4,1) + 1;
    elseif strcmp(StageNFE2018pre{counter1},'Grant') 
        countStageNFE2018pre(5,1) = countStageNFE2018pre(5,1) + 1;
    elseif strcmp(StageNFE2018pre{counter1},'Corporate') 
        countStageNFE2018pre(6,1) = countStageNFE2018pre(6,1) + 1;
    elseif strcmp(StageNFE2018pre{counter1},'Merger') 
        countStageNFE2018pre(7,1) = countStageNFE2018pre(7,1) + 1;
    elseif strcmp(StageNFE2018pre{counter1},'Debt') 
        countStageNFE2018pre(8,1) = countStageNFE2018pre(8,1) + 1;
    end
end

% Non-Accelerator, 2018, post one year
countStageNFE2018post = [0; 0; 0; 0; 0; 0; 0; 0];
for counter1 = 1:length(StageNFE2018post)
    if strcmp(StageNFE2018post{counter1},'Accelerator/Incubator')      
        countStageNFE2018post(1,1) = countStageNFE2018post(1,1) + 1;
    elseif contains(StageNFE2018post{counter1},'Seed') 
        countStageNFE2018post(2,1) = countStageNFE2018post(2,1) + 1;
    elseif contains(StageNFE2018post{counter1},'VC') 
        countStageNFE2018post(3,1) = countStageNFE2018post(3,1) + 1;
    elseif strcmp(StageNFE2018post{counter1},'Angel') 
        countStageNFE2018post(4,1) = countStageNFE2018post(4,1) + 1;
    elseif strcmp(StageNFE2018post{counter1},'Grant') 
        countStageNFE2018post(5,1) = countStageNFE2018post(5,1) + 1;
    elseif strcmp(StageNFE2018post{counter1},'Corporate') 
        countStageNFE2018post(6,1) = countStageNFE2018post(6,1) + 1;
    elseif strcmp(StageNFE2018post{counter1},'Merger/Acquisition') 
        countStageNFE2018post(7,1) = countStageNFE2018post(7,1) + 1;
    elseif strcmp(StageNFE2018post{counter1},'Debt') 
        countStageNFE2018post(8,1) = countStageNFE2018post(8,1) + 1;
    end
end

% Store data into rows. There are 6 cols. for 2017 data, 4 cols. for 2018.
dataStage2017 = [countStageFE2017pre, countStageFE2017post, ...
    countStageFE2017postpost, countStageNFE2017pre, ...
    countStageNFE2017post, countStageNFE2017postpost];
dataStage2018 = [countStageFE2018pre, countStageFE2018post, ...
    countStageNFE2018pre, countStageNFE2018post];





%%%%%%%%%%%%%%%%%%%% Prepping Data for Post Processing %%%%%%%%%%%%%%%%%%




% Pre-allocate cell array for post-processing of quantitative results.
QuantitativeAnalysis = cell(5,13);

% Create post-processing table of quantitative results.
% 2017
QuantitativeAnalysis{1,1} = '2017';
QuantitativeAnalysis{2,1} = 'Avg. Inv. Funding';
QuantitativeAnalysis{3,1} = 'Avg. Num. of Inv.';
QuantitativeAnalysis{4,1} = 'Avg. Num. of Board Mem.';
QuantitativeAnalysis{5,1} = 'Avg. Num. of Employees';

QuantitativeAnalysis{1,2} = 'FE, Pre';
QuantitativeAnalysis{2,2} = meanTIFE2017pre;
QuantitativeAnalysis{3,2} = meanInvFE2017pre;
QuantitativeAnalysis{4,2} = meanBrdFE2017pre;
QuantitativeAnalysis{5,2} = meanEmpFE2017pre;

QuantitativeAnalysis{1,3} = 'FE, Post';
QuantitativeAnalysis{2,3} = meanTIFE2017post;
QuantitativeAnalysis{3,3} = meanInvFE2017post;
QuantitativeAnalysis{4,3} = meanBrdFE2017post;
QuantitativeAnalysis{5,3} = meanEmpFE2017post;

QuantitativeAnalysis{1,4} = 'FE, 2 Years After';
QuantitativeAnalysis{2,4} = meanTIFE2017postpost;
QuantitativeAnalysis{3,4} = meanInvFE2017postpost;
QuantitativeAnalysis{4,4} = meanBrdFE2017postpost;
QuantitativeAnalysis{5,4} = meanEmpFE2017postpost;

QuantitativeAnalysis{1,5} = 'NFE, Pre';
QuantitativeAnalysis{2,5} = meanTINFE2017pre;
QuantitativeAnalysis{3,5} = meanInvNFE2017pre;
QuantitativeAnalysis{4,5} = meanBrdNFE2017pre;
QuantitativeAnalysis{5,5} = meanEmpNFE2017pre;

QuantitativeAnalysis{1,6} = 'NFE, Post';
QuantitativeAnalysis{2,6} = meanTINFE2017post;
QuantitativeAnalysis{3,6} = meanInvNFE2017post;
QuantitativeAnalysis{4,6} = meanBrdNFE2017post;
QuantitativeAnalysis{5,6} = meanEmpNFE2017post;

QuantitativeAnalysis{1,7} = 'NFE, 2 Years After';
QuantitativeAnalysis{2,7} = meanTINFE2017postpost;
QuantitativeAnalysis{3,7} = meanInvNFE2017postpost;
QuantitativeAnalysis{4,7} = meanBrdNFE2017postpost;
QuantitativeAnalysis{5,7} = meanEmpNFE2017postpost;


% 2018
QuantitativeAnalysis{1,9} = '2018';
QuantitativeAnalysis{2,9} = 'Avg. Inv. Funding';
QuantitativeAnalysis{3,9} = 'Avg. Num. of Inv.';
QuantitativeAnalysis{4,9} = 'Avg. Num. of Board Mem.';
QuantitativeAnalysis{5,9} = 'Avg. Num. of Employees';

QuantitativeAnalysis{1,10} = 'FE, Pre';
QuantitativeAnalysis{2,10} = meanTIFE2018pre;
QuantitativeAnalysis{3,10} = meanInvFE2018pre;
QuantitativeAnalysis{4,10} = meanBrdFE2018pre;
QuantitativeAnalysis{5,10} = meanEmpFE2018pre;

QuantitativeAnalysis{1,11} = 'FE, Post';
QuantitativeAnalysis{2,11} = meanTIFE2018post;
QuantitativeAnalysis{3,11} = meanInvFE2018post;
QuantitativeAnalysis{4,11} = meanBrdFE2018post;
QuantitativeAnalysis{5,11} = meanEmpFE2018post;

QuantitativeAnalysis{1,12} = 'NFE, Pre';
QuantitativeAnalysis{2,12} = meanTINFE2018pre;
QuantitativeAnalysis{3,12} = meanInvNFE2018pre;
QuantitativeAnalysis{4,12} = meanBrdNFE2018pre;
QuantitativeAnalysis{5,12} = meanEmpNFE2018pre;

QuantitativeAnalysis{1,13} = 'NFE, Post';
QuantitativeAnalysis{2,13} = meanTINFE2018post;
QuantitativeAnalysis{3,13} = meanInvNFE2018post;
QuantitativeAnalysis{4,13} = meanBrdNFE2018post;
QuantitativeAnalysis{5,13} = meanEmpNFE2018post;

% Quantitative data can be easily copied and exported to Microsoft Excel
% for post processing and further analysis. Qualitative data has been
% counted and placed into usable small tables that can be easily copied to
% Excel and further analyzed.

