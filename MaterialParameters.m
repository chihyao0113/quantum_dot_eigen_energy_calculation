function [lattic_const,C11,C12,C44]=MaterialParameters(material,structure)

switch structure
    case {'ZB'}
        switch material
            case {'InAs'}
                lattic_const=6.058;
                C11=0.83;
                C12=0.45;
                C44=0.40;
            case {'GaAs'}
                lattic_const=5.653;
                C11=1.18;
                C12=0.54;
                C44=0.59;
            case {'Si'}
                lattic_const=5.431;
                C11=1.675;
                C12=0.65;
                C44=0.801;
            case {'Ge'}
                lattic_const=5.658;
                C11=1.315;
                C12=0.494;
                C44=0.684;
            case {'GaN'}
                lattic_const=4.46;
                C11=296;
                C12=154;
                C44=155;
            case {'AlN'}
                lattic_const=4.32;
                C11=304;
                C12=152;
                C44=199;
        end
    case {'WZ'}
        switch material
            case {'GaN'}
                lattic_const=4.5;
                C11=293;
                C12=159;
                C44=155;
            case {'AlN'}
                lattic_const=4.38;
                C11=304;
                C12=160;
                C44=193;
        end
end
