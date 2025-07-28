<script setup>
import AuthenticatedLayout from '@/layouts/AuthenticatedLayout.vue'
import { ref } from 'vue'

const projects = ref([
  {
    id: 1,
    name: 'E-commerce Platform',
    description: 'Build a modern e-commerce platform with React and Node.js',
    progress: 75,
    tasks: 12,
    completedTasks: 9,
    priority: 'high',
    dueDate: '2024-02-15',
    team: ['John Doe', 'Jane Smith', 'Mike Johnson']
  },
  {
    id: 2,
    name: 'Mobile App Development',
    description: 'Create a cross-platform mobile app using Flutter',
    progress: 45,
    tasks: 18,
    completedTasks: 8,
    priority: 'medium',
    dueDate: '2024-03-20',
    team: ['Sarah Wilson', 'Alex Brown']
  },
  {
    id: 3,
    name: 'Website Redesign',
    description: 'Modernize the company website with new design and features',
    progress: 90,
    tasks: 8,
    completedTasks: 7,
    priority: 'low',
    dueDate: '2024-01-30',
    team: ['David Lee', 'Emily Chen']
  }
])

const recentTasks = ref([
  {
    id: 1,
    title: 'Design user authentication flow',
    project: 'E-commerce Platform',
    assignee: 'John Doe',
    status: 'in-progress',
    priority: 'high',
    dueDate: '2024-01-20'
  },
  {
    id: 2,
    title: 'Implement payment gateway integration',
    project: 'E-commerce Platform',
    assignee: 'Jane Smith',
    status: 'completed',
    priority: 'high',
    dueDate: '2024-01-18'
  },
  {
    id: 3,
    title: 'Create mobile app wireframes',
    project: 'Mobile App Development',
    assignee: 'Sarah Wilson',
    status: 'pending',
    priority: 'medium',
    dueDate: '2024-01-25'
  },
  {
    id: 4,
    title: 'Update website content',
    project: 'Website Redesign',
    assignee: 'David Lee',
    status: 'completed',
    priority: 'low',
    dueDate: '2024-01-15'
  },
  {
    id: 5,
    title: 'Set up CI/CD pipeline',
    project: 'E-commerce Platform',
    assignee: 'Mike Johnson',
    status: 'in-progress',
    priority: 'medium',
    dueDate: '2024-01-22'
  }
])

const getPriorityColor = (priority) => {
  const colors = {
    high: 'bg-red-100 text-red-800 border-red-200',
    medium: 'bg-yellow-100 text-yellow-800 border-yellow-200',
    low: 'bg-green-100 text-green-800 border-green-200'
  }
  return colors[priority] || colors.medium
}

const getStatusColor = (status) => {
  const colors = {
    'completed': 'bg-green-100 text-green-800',
    'in-progress': 'bg-blue-100 text-blue-800',
    'pending': 'bg-gray-100 text-gray-800'
  }
  return colors[status] || colors.pending
}

const getStatusIcon = (status) => {
  const icons = {
    'completed': '✓',
    'in-progress': '⟳',
    'pending': '⏳'
  }
  return icons[status] || '⏳'
}
</script>

<template>
  <AuthenticatedLayout>
    <div class="bg-white rounded-xl shadow-xl border border-gray-100 overflow-hidden">
      <div class="p-6 sm:p-8">
        <div class="mb-8">
          <h1 class="text-3xl font-bold text-gray-900 mb-2">Task Management Dashboard</h1>
          <p class="text-gray-600">Manage your projects and tasks efficiently</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <div class="bg-gradient-to-r from-blue-500 to-blue-600 rounded-lg p-6 text-white">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-blue-100 text-sm font-medium">Total Projects</p>
                <p class="text-3xl font-bold">{{ projects.length }}</p>
              </div>
              <div class="text-blue-200">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg>
              </div>
            </div>
          </div>

          <div class="bg-gradient-to-r from-green-500 to-green-600 rounded-lg p-6 text-white">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-green-100 text-sm font-medium">Total Tasks</p>
                <p class="text-3xl font-bold">{{ recentTasks.length }}</p>
              </div>
              <div class="text-green-200">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                </svg>
              </div>
            </div>
          </div>

          <div class="bg-gradient-to-r from-purple-500 to-purple-600 rounded-lg p-6 text-white">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-purple-100 text-sm font-medium">In Progress</p>
                <p class="text-3xl font-bold">{{ recentTasks.filter(task => task.status === 'in-progress').length }}</p>
              </div>
              <div class="text-purple-200">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
            </div>
          </div>

          <div class="bg-gradient-to-r from-orange-500 to-orange-600 rounded-lg p-6 text-white">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-orange-100 text-sm font-medium">Completed</p>
                <p class="text-3xl font-bold">{{ recentTasks.filter(task => task.status === 'completed').length }}</p>
              </div>
              <div class="text-orange-200">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
              </div>
            </div>
          </div>
        </div>

        <div class="mb-8">
          <h2 class="text-2xl font-semibold text-gray-900 mb-6">Active Projects</h2>
          <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div v-for="project in projects" :key="project.id" class="bg-gray-50 rounded-lg p-6 border border-gray-200 hover:shadow-md transition-shadow">
              <div class="flex items-start justify-between mb-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-1">{{ project.name }}</h3>
                  <p class="text-sm text-gray-600 mb-3">{{ project.description }}</p>
                </div>
                <span :class="`px-2 py-1 text-xs font-medium rounded-full border ${getPriorityColor(project.priority)}`">
                  {{ project.priority }}
                </span>
              </div>

              <div class="mb-4">
                <div class="flex items-center justify-between text-sm text-gray-600 mb-2">
                  <span>Progress</span>
                  <span>{{ project.progress }}%</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2">
                  <div class="bg-blue-600 h-2 rounded-full transition-all duration-300" :style="{ width: project.progress + '%' }"></div>
                </div>
              </div>

              <div class="flex items-center justify-between text-sm text-gray-600 mb-4">
                <span>{{ project.completedTasks }}/{{ project.tasks }} tasks completed</span>
                <span>Due: {{ new Date(project.dueDate).toLocaleDateString() }}</span>
              </div>

              <div class="flex items-center">
                <span class="text-sm text-gray-600 mr-2">Team:</span>
                <div class="flex -space-x-2">
                  <div v-for="(member, index) in project.team.slice(0, 3)" :key="index"
                       class="w-6 h-6 bg-blue-500 rounded-full flex items-center justify-center text-white text-xs font-medium">
                    {{ member.split(' ').map(n => n[0]).join('') }}
                  </div>
                  <div v-if="project.team.length > 3"
                       class="w-6 h-6 bg-gray-300 rounded-full flex items-center justify-center text-gray-600 text-xs font-medium">
                    +{{ project.team.length - 3 }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div>
          <h2 class="text-2xl font-semibold text-gray-900 mb-6">Recent Tasks</h2>
          <div class="bg-gray-50 rounded-lg overflow-hidden">
            <div class="overflow-x-auto">
              <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-100">
                  <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Task</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Project</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Assignee</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Priority</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Due Date</th>
                  </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                  <tr v-for="task in recentTasks" :key="task.id" class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                      <div class="text-sm font-medium text-gray-900">{{ task.title }}</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      <div class="text-sm text-gray-600">{{ task.project }}</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      <div class="text-sm text-gray-600">{{ task.assignee }}</div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      <span :class="`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${getStatusColor(task.status)}`">
                        <span class="mr-1">{{ getStatusIcon(task.status) }}</span>
                        {{ task.status }}
                      </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      <span :class="`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border ${getPriorityColor(task.priority)}`">
                        {{ task.priority }}
                      </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                      {{ new Date(task.dueDate).toLocaleDateString() }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>