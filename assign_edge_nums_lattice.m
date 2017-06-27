function [edgeEnds, nedge] = assign_edge_nums_lattice(r, c, l, nrows,ncols,nlevs)
% function [out_edge, outNbr, edgeEndsIJ, edgeEndsRC, in_edge, nedges] = ...
%     assign_edge_nums_lattice(r, c, l, nrows,ncols,nlevs)

%   To assign edge numbers:
%   we loop through the nodes in COLUMN major (Matlab-style) order
%       At each node, we then assign in the order: 
%           Left(West), Above(North), Below(Souht), Right(East)
%
%   This ordering is done to be compatible with
%   StarEdge_MakeEdgeNums_Lattice2.m
%   (orders edges by increasing fromNode, then increasing toNode)
%
% out_edge(r,c,dir) = number of edge going OUT of rc in direction dir
% outNbr(r,c,dir,:) = [r' c'] if we follow an edge in direction dir from rc we land in r'c'
% edgeEndsIJ(e,:) = [i j] means we follow e from i to j
% edgeEndsRC(e,:) = [r1 c2 r2 c2] means we follow e from r1c1 to r2c2
% in_edge(r,c,dir)
%
% Example: consider a 2x2 lattice
%
%    3     7
% N1 ->   <- N3
% |5         |6
% v          v
%
% ^          ^
% |1         |2
% N2->    <- N4
%   4      8
%
% so edges 1:2 are the northbound, 3:4 the eastbound, etc
    
% assign each edge in each direction a unique number
%  north = 1; east = 2; south = 3; west = 4; up = 5; down = 6;% matches BP_C_edgeDir/private/*.c
% % %north = 2; east = 1; south = 4; west = 3;
% ndir = 6; % num directions to send msgs in
% out_edge = [];
% in_edge = [];
% outNbr = [];
nrows=111; ncols=94; nlevs=199;
% % nedgesUndir = nrows*(ncols-1) + ncols*(nrows-1);
nedgesUndir=(nrows-2)*(ncols-2)*(nlevs-2)*6+((nrows-2)*(ncols-2)+(ncols-2)*(nlevs-2)+(nrows-2)*(nlevs-2))*10 ...
    +((nrows-2)+(ncols-2)+(nlevs-2))*16+24;
% nedgesDir2 = nedgesUndir*2;
% edgeEndsRC = zeros(nedgesDir, 6);
% edgeEndsIJ = zeros(nedgesDir, 3);



e = 1;
            % left
            if legal(r,c-1,l,nrows,ncols,nlevs)
%                 out_edge(r,c,l,west) = e;
%                 in_edge(r,c-1,l,east) = e;
%                 outNbr(r,c,l,west,:) = [r c-1 l];
                edgeEnds(e,:) = [r c l r c-1 l];
                e = e+1;
            end

            % above
            if legal(r-1,c,l,nrows,ncols,nlevs)
%                 out_edge(r,c,l,north) = e;
%                 in_edge(r-1,c,l,south) = e;
%                 outNbr(r,c,l,north,:) = [r-1 c l];
                edgeEnds(e,:) = [r c l r-1 c l];
                e = e+1;
            end

            % below
            if legal(r+1,c,l,nrows,ncols,nlevs)
%                 out_edge(r,c,l,south) = e;
%                 in_edge(r+1,c,l,north) = e;
%                 outNbr(r,c,l,south,:) = [r+1 c l];
                edgeEnds(e,:) = [r c l r+1 c l];
                e = e+1;
            end

            % right
            if legal(r,c+1,l,nrows,ncols,nlevs)
%                 out_edge(r,c,l,east) = e;
%                 in_edge(r,c+1,l,west) = e;
%                 outNbr(r,c,l,east,:) = [r c+1 l];
                edgeEnds(e,:) = [r c l r c+1 l];
                e = e+1;
            end
            
            % up
            if legal(r,c,l-1,nrows,ncols,nlevs)
%                 out_edge(r,c,l,up) = e;
%                 in_edge(r,c,l-1,down) = e;
%                 outNbr(r,c,l,up,:) = [r c l-1];
                edgeEnds(e,:) = [r c l r c l-1];
                e = e+1;
            end

            % down
            if legal(r,c,l+1,nrows,ncols,nlevs)
%                 out_edge(r,c,l,down) = e;
%                 in_edge(r,c,l+1,up) = e;
%                 outNbr(r,c,l,down,:) = [r c l+1];
                edgeEnds(e,:) = [r c l r c l+1];
                e = e+1;
            end
        
nedge = e-1;

% edgeEndsIJ(:,1) = subv2ind([nrows ncols nlevs], edgeEndsRC(:,1:3));
% edgeEndsIJ(:,2) = subv2ind([nrows ncols nlevs], edgeEndsRC(:,4:6));


function [bool] = legal(i,j,l,nrows,ncols,nlevs)
if i >= 1 && j >= 1 && l >= 1 && i <= nrows && j <=ncols && l <=nlevs
    bool = 1;
else
    bool = 0;
end


% % function [out_edge, outNbr, edgeEndsIJ, edgeEndsRC, in_edge, nedges] = ...
% %     assign_edge_nums_lattice(nrows, ncols, nlevs)
% % 
% % % assign each edge in each direction a unique number
% % north = 1; east = 2; south = 3; west = 4; up = 5; down = 6;% matches BP_C_edgeDir/private/*.c
% % %north = 2; east = 1; south = 4; west = 3;
% % ndir = 6; % num directions to send msgs in
% % out_edge = zeros(nrows, ncols, nlevs, ndir);
% % in_edge = zeros(nrows, ncols, nlevs, ndir);
% % outNbr = zeros(nrows, ncols, nlevs, ndir, 3);
% % nedgesDir=(nrows-2)*(ncols-2)*(nlevs-2)*6+((nrows-2)*(ncols-2)+(ncols-2)*(nlevs-2)+(nrows-2)*(nlevs-2))*10 ...
% %     +(nrows-2)*16+(ncols-2)*16+(nlevs-2)*16+24;
% % % nedgesUndir = nrows*(ncols-1) + ncols*(nrows-1);
% % % nedgesDir = nedgesUndir*2;
% % edgeEndsRC = zeros(nedgesDir, 6);
% % edgeEndsIJ = zeros(nedgesDir, 3);
% % e = 1;
% % for l=1:nlevs
% %     for c = 1:ncols
% %         for r = 1:nrows
% % 
% %             % left
% %             if legal(r,c-1,l,nrows,ncols,nlevs)
% %                 out_edge(r,c,l,west) = e;
% %                 in_edge(r,c-1,l,east) = e;
% %                 outNbr(r,c,l,west,:) = [r c-1 l];
% %                 edgeEndsRC(e,:) = [r c l r c-1 l];
% %                 e = e+1;
% %             end
% % 
% %             % above
% %             if legal(r-1,c,l,nrows,ncols,nlevs)
% %                 out_edge(r,c,l,north) = e;
% %                 in_edge(r-1,c,l,south) = e;
% %                 outNbr(r,c,l,north,:) = [r-1 c l];
% %                 edgeEndsRC(e,:) = [r c l r-1 c l];
% %                 e = e+1;
% %             end
% % 
% %             % below
% %             if legal(r+1,c,l,nrows,ncols,nlevs)
% %                 out_edge(r,c,l,south) = e;
% %                 in_edge(r+1,c,l,north) = e;
% %                 outNbr(r,c,l,south,:) = [r+1 c l];
% %                 edgeEndsRC(e,:) = [r c l r+1 c l];
% %                 e = e+1;
% %             end
% % 
% %             % right
% %             if legal(r,c+1,l,nrows,ncols,nlevs)
% %                 out_edge(r,c,l,east) = e;
% %                 in_edge(r,c+1,l,west) = e;
% %                 outNbr(r,c,l,east,:) = [r c+1 l];
% %                 edgeEndsRC(e,:) = [r c l r c+1 l];
% %                 e = e+1;
% %             end
% %             
% %             % up
% %             if legal(r,c,l-1,nrows,ncols,nlevs)
% %                 out_edge(r,c,l,up) = e;
% %                 in_edge(r,c,l-1,down) = e;
% %                 outNbr(r,c,l,up,:) = [r c l-1];
% %                 edgeEndsRC(e,:) = [r c l r c l-1];
% %                 e = e+1;
% %             end
% % 
% %             % down
% %             if legal(r,c,l+1,nrows,ncols,nlevs)
% %                 out_edge(r,c,l,down) = e;
% %                 in_edge(r,c,l+1,up) = e;
% %                 outNbr(r,c,l,down,:) = [r c l+1];
% %                 edgeEndsRC(e,:) = [r c l r c l+1];
% %                 e = e+1;
% %             end
% %         end
% %     end
% % end
% % nedges = e-1;
% % 
% % edgeEndsIJ(:,1) = subv2ind([nrows ncols nlevs], edgeEndsRC(:,1:3));
% % edgeEndsIJ(:,2) = subv2ind([nrows ncols nlevs], edgeEndsRC(:,4:6));
% % 
% % 
% % function [bool] = legal(i,j,l,nrows,ncols,nlevs)
% % if i >= 1 && j >= 1 && l >= 1 && i <= nrows && j <=ncols && l <=nlevs
% %     bool = 1;
% % else
% %     bool = 0;
% % end