function plan = buildfile
% Create a plan from the task functions
plan = buildplan(localfunctions);
import matlab.buildtool.Task;

% Make the "archive" task the default task in the plan
plan.DefaultTasks = ["archive1"];

plan("test1") = Task(Actions=@test1Action, Description="😊")
plan("check1") = Task(Actions=@check1Action, Description="🚀")
plan("archive1") = Task(Actions=@archive1Action, Description="💸")
% Make the "archive" task dependent on the "check" and "test" tasks
plan("archive1").Dependencies = ["check1" "test1"];
plan("archive2").Dependencies = ["check2" "test2"];
end

function check1Action(~)
pause(12);
% Identify code issues
% issues = codeIssues;
% assert(isempty(issues.Issues),formattedDisplayText( ...
%    issues.Issues(:,["Location" "Severity" "Description"])))
disp('In check task');
end

function test1Action(~)
pause(5);
% Run unit tests
% results = runtests(IncludeSubfolders=true,OutputDetail="terse");
% assertSuccess(results);
disp('In test task');
end

function archive1Task(~)
pause(2);
% Create ZIP file
% zipFileName = "source_" + ...
%     string(datetime("now",Format="yyyyMMdd'T'HHmmss"));
% zip(zipFileName,"*")
disp('In archive task');
end

function check2Task(~)
% Identify code issues
% issues = codeIssues;
% assert(isempty(issues.Issues),formattedDisplayText( ...
%    issues.Issues(:,["Location" "Severity" "Description"])))
disp('In check task');
end

function test2Task(~)
% Run unit tests
% results = runtests(IncludeSubfolders=true,OutputDetail="terse");
% assertSuccess(results);
disp('In test task');
end

function archive2Task(~)
% Create ZIP file
% zipFileName = "source_" + ...
%     string(datetime("now",Format="yyyyMMdd'T'HHmmss"));
% zip(zipFileName,"*")
disp('In archive task');
end

%function testTask(~)
% Create ZIP file
% zipFileName = "source_" + ...
%     string(datetime("now",Format="yyyyMMdd'T'HHmmss"));
% zip(zipFileName,"*")
%a=b;
%end
