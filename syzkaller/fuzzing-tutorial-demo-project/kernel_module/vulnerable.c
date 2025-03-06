#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include <linux/uaccess.h>
#include <linux/string.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("Vulnerable Kernel Module for Syzkaller");

static struct proc_dir_entry *proc_entry;
static char kernel_buffer[16]; // Small buffer for vulnerability

static ssize_t vulnerable_write(struct file *file, const char __user *ubuf, size_t count, loff_t *ppos) {
    if (count > sizeof(kernel_buffer)) {
        printk(KERN_ALERT "Buffer overflow attempted!\\n");
        // Intentionally not handling the overflow, creating the vulnerability.
    }
    if (copy_from_user(kernel_buffer, ubuf, count)) {
        return -EFAULT;
    }
    return count;
}

static const struct proc_ops proc_file_fops = {
    .proc_write = vulnerable_write,
};

static int __init vulnerable_module_init(void) {
    proc_entry = proc_create("vulnerable_module", 0666, NULL, &proc_file_fops);
    if (!proc_entry) {
        printk(KERN_ALERT "Failed to create proc entry\\n");
        return -ENOMEM;
    }
    printk(KERN_INFO "Vulnerable module loaded\\n");
    return 0;
}

static void __exit vulnerable_module_exit(void) {
    proc_remove(proc_entry);
    printk(KERN_INFO "Vulnerable module unloaded\\n");
}

module_init(vulnerable_module_init);
module_exit(vulnerable_module_exit);
