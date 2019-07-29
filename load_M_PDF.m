function [M,pdf] = load_M_PDF(scenario, profile, model)
switch model
    case 'complete'
        switch profile
            case 'volkswagen'
                switch scenario
                    case 'highway'
                        M = csvread('M_matrix\M_VolkswagenHighway.csv');
                        pdf = csvread('PDF\PDF_VolkswagenHighway.csv');
                    case 'suburban'
                        M = csvread('M_matrix\M_VolkswagenSuburban.csv');
                        pdf = csvread('PDF\PDF_VolkswagenSuburban.csv');
                    case 'urban'
                        M = csvread('M_matrix\M_VolkswagenUrban.csv');
                        pdf = csvread('PDF\PDF_VolkswagenUrban.csv');
                    case 'universal'
                        M = csvread('M_matrix\M_VolkswagenUniversal.csv');
                        pdf = csvread('PDF\PDF_VolkswagenUniversal.csv');
                    otherwise
                        error('''scenario'' parameter value is not valid. Try ''highway'', ''suburban'', ''urban'' or ''universal''');
                end
            case 'renault'
                switch scenario
                    case 'highway'
                        M = csvread('M_matrix\M_RenaultHighway.csv');
                        pdf = csvread('PDF\PDF_RenaultHighway.csv');
                    case 'suburban'
                        M = csvread('M_matrix\M_RenaultSuburban.csv');
                        pdf = csvread('PDF\PDF_RenaultSuburban.csv');
                    case 'urban'
                        M = csvread('M_matrix\M_RenaultUrban.csv');
                        pdf = csvread('PDF\PDF_RenaultUrban.csv');
                    case 'universal'
                        M = csvread('M_matrix\M_RenaultUniversal.csv');
                        pdf = csvread('PDF\PDF_RenaultUniversal.csv');
                    otherwise
                        error('''scenario'' parameter value is not valid. Try ''highway'', ''suburban'', ''urban'' or ''universal''');
                end
            otherwise
                error('''profile'' parameter value is not valid. Try ''volkswagen'' or ''renault''');
        end
    case 'intervals'
        switch profile
            case 'volkswagen'
                switch scenario
                    case 'highway'
                        M = csvread('M_matrix\M_VolkswagenHighway_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenHighway_IntervalsOnly.csv');
                    case 'suburban'
                        M = csvread('M_matrix\M_VolkswagenSuburban_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenSuburban_IntervalsOnly.csv');
                    case 'urban'
                        M = csvread('M_matrix\M_VolkswagenUrban_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenUrban_IntervalsOnly.csv');
                    case 'universal'
                        M = csvread('M_matrix\M_VolkswagenUniversal_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenUniversal_IntervalsOnly.csv');
                    otherwise
                        error('''scenario'' parameter value is not valid. Try ''highway'', ''suburban'', ''urban'' or ''universal''');
                end
            case 'renault'
                switch scenario
                    case 'highway'
                        M = csvread('M_matrix\M_RenaultHighway_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultHighway_IntervalsOnly.csv');
                    case 'suburban'
                        M = csvread('M_matrix\M_RenaultSuburban_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultSuburban_IntervalsOnly.csv');
                    case 'urban'
                        M = csvread('M_matrix\M_RenaultUrban_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultUrban_IntervalsOnly.csv');
                    case 'universal'
                        M = csvread('M_matrix\M_RenaultUniversal_IntervalsOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultUniversal_IntervalsOnly.csv');
                    otherwise
                        error('''scenario'' parameter value is not valid. Try ''highway'', ''suburban'', ''urban'' or ''universal''');
                end
            otherwise
                error('''profile'' parameter value is not valid. Try ''volkswagen'' or ''renault''');
        end
    case 'sizes'
        switch profile
            case 'volkswagen'
                switch scenario
                    case 'highway'
                        M = csvread('M_matrix\M_VolkswagenHighway_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenHighway_SizesOnly.csv');
                    case 'suburban'
                        M = csvread('M_matrix\M_VolkswagenSuburban_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenSuburban_SizesOnly.csv');
                    case 'urban'
                        M = csvread('M_matrix\M_VolkswagenUrban_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenUrban_SizesOnly.csv');
                    case 'universal'
                        M = csvread('M_matrix\M_VolkswagenUniversal_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_VolkswagenUniversal_SizesOnly.csv');
                    otherwise
                        error('''scenario'' parameter value is not valid. Try ''highway'', ''suburban'', ''urban'' or ''universal''');
                end
            case 'renault'
                switch scenario
                    case 'highway'
                        M = csvread('M_matrix\M_RenaultHighway_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultHighway_SizesOnly.csv');
                    case 'suburban'
                        M = csvread('M_matrix\M_RenaultSuburban_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultSuburban_SizesOnly.csv');
                    case 'urban'
                        M = csvread('M_matrix\M_RenaultUrban_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultUrban_SizesOnly.csv');
                    case 'universal'
                        M = csvread('M_matrix\M_RenaultUniversal_SizesOnly.csv');
                        pdf = csvread('PDF\PDF_RenaultUniversal_SizesOnly.csv');
                    otherwise
                        error('''scenario'' parameter value is not valid. Try ''highway'', ''suburban'', ''urban'' or ''universal''');
                end
            otherwise
                error('''profile'' parameter value is not valid. Try ''volkswagen'' or ''renault''');
        end
    otherwise
        error('''model'' parameter value is not valid. Try ''complete'', ''intervals'' or ''sizes''');
end
end