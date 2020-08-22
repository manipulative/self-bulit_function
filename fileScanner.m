function tempFilesList=fileScanner(filesType,pathName)
% To read all same type files in a folder and its subfolders. Then put their
% names and pathes into a struct
% Input:filestype,path
% Output:filesInfo (struct)

p=genpath(pathName);
length_p = size(p,2);
path = {};
temp = [];
tempFilesList=[];
filesTypeName=['*.' filesType];

% save subfiles' name to variable: path
for i = 1:length_p %Ѱ�ҷָ��';'��һ���ҵ�����·��tempд��path������
    if p(i) ~= ';'
        temp = [temp p(i)];
    else 
        temp = [temp '\']; %��·���������� '\'
        path = [path ; temp];
        temp = [];
    end
end 

%swich among each subfile and read texts
for i=1:numel(path)
    currentName=cell2mat(path(i));
    cd(currentName)
    traverseName=[currentName filesTypeName]; %change the path name to only read files with .filestype
    FileList=dir(traverseName);
    
    if numel(FileList)==0 %�жϸ��ļ������Ƿ���ָ�������ļ�
        continue
    else
        tempFilesList=[tempFilesList;FileList]; %��ȡ�ļ����ƺ�·��,��������һ��struct��
        
    end
end
%output
cd(pathName); %���س�ʼĿ¼
%filesInfo=struct('name',tempFilesNameList,'path',tempFilesPathList);